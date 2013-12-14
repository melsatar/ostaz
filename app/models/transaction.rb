class Transaction < ActiveRecord::Base
        @accounts = Account.all
	belongs_to :from_account, class_name: Account#, before_add: [:check_amount_exist]
	belongs_to :to_account, class_name: Account
        validates :t_amount, numericality: { greater_than: 0 }
        account = Account.find_by_id(:from_account)
        #attr_accessible :t_amount
        #validates_associated Account

      #before_create :check_amount_exist(account)
      before_create :check_amount_exist
      before_update :check_amount_exist
      #validates :check_amount_exist

      def check_amount_exist
          if Account.find_by_id(self.from_account_id).a_amount >= self.t_amount
             true
          else
	     
	     errors[:base] << Account.find_by_id(self.from_account_id).a_name + " Account does not have enough balance it only have = " + Account.find_by_id(self.from_account_id).a_amount.to_s
 	     false 
             #return "The account does not have enough amount"
          end
      end
end
