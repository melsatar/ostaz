Feature: adding a transaction
 
  As an accountant
  So that I can quickly add transaction
  I want to see the added transaction

Scenario: adding a transaction
        Given I am on the homepage
        And I follow "New Transaction"
	Then I should be on the new transaction page
        Given From account "Cash, Bank" exist
	When I select "Bank" from "transaction_from_account_id"
        Given To account "Cash, Bank" exist
        When I select "Cash" with "transaction_to_account_id"
        And I fill in "transaction_t_amount" with "1000"
        And I fill in "transaction_t_desc" with "test"
        When I press "Create Transaction"
        Then I should see "Transaction was successfully created."

