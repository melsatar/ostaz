class Transaction < ActiveRecord::Base
        @accounts = Account.all
	belongs_to :from_account, class_name: Account
	belongs_to :to_account, class_name: Account
        #validates_associated Account
end
