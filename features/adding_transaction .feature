Feature: adding a transaction
 
  As an accountant
  So that I can quickly add transaction
  I want to see the added transaction

Scenario: adding a transaction
	Given I am an authenticated user, username is "admin@ostaz.com" and password is "12345678"
        Given I am on the homepage
        And I follow "New Transaction"
	Then I should be on the new transaction page
	Then I select "Bank" from "transaction_from_account_id"
        Then I select "Cash" from "transaction_to_account_id"
        And I fill in "transaction_t_amount" with "1000"
        And I fill in "transaction_t_desc" with "test"
        When I attach the file "./public/images/an_image.png" to "transaction_t_attac"
        When I press "Create Transaction"
        Then I should see "Transaction was successfully created."

