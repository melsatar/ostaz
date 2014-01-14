class Transaction < ActiveRecord::Base
	has_attached_file :t_attac, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	@accounts = Account.all
	belongs_to :from_account, class_name: Account#, before_add: [:check_amount_exist]
	belongs_to :to_account, class_name: Account
        validates :t_amount, numericality: { greater_than: 0 }
        validates_attachment :t_attac,	:content_type => { :content_type => ["image/jpg","image/jpeg", "image/gif", "image/png"] }

      #before_create :check_amount_exist
      before_save :check_amount_exist
	  before_save :validate_transaction
      after_save :validate_all_accounts
      before_update :check_amount_exist

    def check_amount_exist
		from_account_type = Account.find_by_id(self.from_account_id).a_type
		
		if from_account_type = "liability" || Account.find_by_id(self.from_account_id).a_amount >= self.t_amount
            true
		else
			errors[:base] << Account.find_by_id(self.from_account_id).a_name + " Account does not have enough balance it only have = " + Account.find_by_id(self.from_account_id).a_amount.to_s
			false 
             #return "The account does not have enough amount"
        end
	end
	
	def validate_transaction
		from_account_type = Account.find_by_id(self.from_account_id).a_type
		p from_account_type+"ooooooooooooooooooooooooooooooooooo"
		if from_account_type == "Equity" || from_account_type == "Liability"
			t_amount_from_account = self.t_amount
		else
			t_amount_from_account = -self.t_amount
			p t_amount_from_account.to_s + "oooooooooooooooooooooooooooooooooooooooooooooooooooooo"
 
		end
		
		to_account_type = Account.find_by_id(self.to_account_id).a_type
		p to_account_type+"ooooooooooooooooooooooooooooooooooo"
		t_amount_to_account  = self.t_amount
		
		@asset_amount = 0
		@liability_amount = 0
		@equity_amount = 0
		@expense_amount = 0

		case from_account_type 
		when "Asset"
			@asset_amount += t_amount_from_account
		when "Liability"
			@liability_amount += t_amount_from_account
		when "Equity"
			@equity_amount += t_amount_from_account
		else 
			@expense_amount += t_amount_from_account
		end	
			
		case to_account_type 
		when "Asset"
			@asset_amount += t_amount_to_account
		when "Liability"
			@liability_amount += t_amount_to_account
		when "Equity"
			@equity_amount -= t_amount_to_account
		else 
			@expense_amount += t_amount_to_account
		end	
		
		if   (@asset_amount - @liability_amount - @equity_amount + @expense_amount ) ==0
		    p "truuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"
			true
        else
			
			p (@asset_amount - @liability_amount - @equity_amount + @expense_amount ).to_s + "oooooooooooooooooooooooooooooooooooooooooooooooooooooo"
			errors[:base] << " The Transaction validation fails "
			false 
				 #return "The account does not have enough amount"
        end
		
	end
	 
	def validate_all_accounts
        
		
		@asset_amount = 0
        Account.select(:a_amount).where("a_type = 'Asset'").each do |asset|
			@asset_amount +=  asset.a_amount
		end
	
		#p "asset amount"+@asset_amount.to_s + "oooooooooooooooooooooooooooooooooooooooooo"
		
		@liability_amount = 0
        Account.select(:a_amount).where("a_type = 'Liability'").each do |liability|
			@liability_amount += liability.a_amount      
        end
		#p "liability amount"+@liability_amount.to_s + "oooooooooooooooooooooooooooooooooooooooooo"

		@expense_amount = 0
        Account.select(:a_amount).where("a_type = 'Expense'").each do |expense|
			@expense_amount += expense.a_amount
        end
		#p "expense amount"+@expense_amount.to_s + "oooooooooooooooooooooooooooooooooooooooooo"

		
		@capital_equity_amount = 0
		@other_equity_amount = 0
        @equity_amount = 0
		
		Account.select(:a_name,:a_amount).where("a_type = 'Equity'").each do |equity|
			if equity.a_name == "Capital"
				@capital_equity_amount=equity.a_amount
			else	
				@other_equity_amount += equity.a_amount 
			end
        end       
		@equity_amount = @capital_equity_amount - @other_equity_amount


		if   (@asset_amount - @liability_amount - @equity_amount + @expense_amount ) ==0
			true
			p "heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
        else
			
			p (@asset_amount - @liability_amount - @equity_amount + @expense_amount ).to_s + "oooooooooooooooooooooooooooooooooooooooooooooooooooooo"
			errors[:base] << " The Transaction validation fails "
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
