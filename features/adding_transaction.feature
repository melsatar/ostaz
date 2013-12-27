Feature: adding a transaction
 
  As an accountant
  So that I can quickly add transaction
  I want to see the added transaction

Scenario: adding a transaction
        Given I am on the homepage
        Given the following accounts
	| a_name             | a_type    | a_amount |
        | Bank               | Asset     | 50000    |
	| Cash               | Asset     | 0.0      |
	| Equipment	     | Asset	 | 0.0	    |	
	| Accounts Payable   | Liability | 0.0	    |
	| Debt	    	     | Liability | 0.0	    |
	| Accounts Receivable|	Asset	 | 0.0      |
	| Office Expenses    |	Expense	 | 0.0	    |
	| Project Expenses   |	Expense	 | 0.0	    |
	| Capital	     |	Equity	 | 50000.0  |	
	| Revenue	     |	Equity	 | 0.0      |

        And I follow "New Transaction"
	Then I should be on the new transaction page
	Then I select "Bank" from "transaction_from_account_id"
        Then I select "Cash" from "transaction_to_account_id"
        And I fill in "transaction_t_amount" with "1000"
        And I fill in "transaction_t_desc" with "test"
        When I attach the file "/home/melsatar/Documents/Project/public/images/an_image.png" to "transaction_t_attac"
        When I press "Create Transaction"
        Then I should see "Transaction was successfully created."

