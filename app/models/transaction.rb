class Transaction < ActiveRecord::Base
	@accounts = Account.all
	belongs_to :from_account, class_name: Account#, before_add: [:check_amount_exist]
	belongs_to :to_account, class_name: Account
        validates :t_amount, numericality: { greater_than: 0 }

      before_create :check_amount_exist
      before_save :validate_all_accounts
      before_update :check_amount_exist

     def check_amount_exist
		if Account.find_by_id(self.from_account_id).a_amount >= self.t_amount
            true
		else
		errors[:base] << Account.find_by_id(self.from_account_id).a_name + " Account does not have enough balance it only have = " + Account.find_by_id(self.from_account_id).a_amount.to_s
			false 
             #return "The account does not have enough amount"
        end
	end

	 
	def validate_all_accounts
        @asset_amount = 0
        Account.select(:a_amount).where("a_type = 'Asset'").each do |asset|
			@asset_amount = asset.a_amount + @asset_amount
              
        end
		
		@liability_amount = 0
        Account.select(:a_amount).where("a_type = 'Liability'").each do |liability|
			@liability_amount = liability.a_amount + @liability_amount
              
        end
        
		@expense_amount = 0
        Account.select(:a_amount).where("a_type = 'Expense'").each do |expense|
			@expense_amount = expense.a_amount + @expense_amount
        end
		
        @equity_amount = 0
		@capital_equity_amount = 0
		@other_equity_amount = 0
        Account.select(:a_name,:a_amount).where("a_type = 'Equity'").each do |equity|
			if equity.a_name == "Capital"
				@capital_equity_amount=equity.a_amount
			else	
				@other_equity_amount += equity.a_amount 
			end
        end       
		@equity_amount = @capital_equity_amount - @other_equity_amount

		if   (@asset_amount - @liability_amount + @expense_amount - @equity_amount) ==0
			true
        else
	     
			errors[:base] << " The Transaction validation fails "
			p (@asset_amount - @liability_amount + @expense_amount - @equity_amount)
			false 
				 #return "The account does not have enough amount"
        end
    end

def self.search(amount,f_account, to_account, t_date)

  @transactions = Transaction.all
  @transactions = @transactions.where(:t_amount => amount) if amount.present?
  @transactions = @transactions.where(:from_account_id => f_account) if f_account.present?
  @transactions = @transactions.where(:to_account_id => to_account) if to_account.present?
  @transactions = @transactions.where(:t_date => t_date) if t_date.present?
  return @transactions
  
end

end
