Feature: adding a transaction
 
  As an accountany
  So that I can quickly add transaction
  I want to see the added transaction

Scenario: adding a transaction
        Given I am on the homepage
        And I follow "New Transaction"
	Then I should be on the new transaction page
        Given From account "Cash, Bank" exist
	When I select "Bank" from "From account"
        Given To account "Cash, Bank" exist
        When I select "Cash" with "To Account"
        And I fill in "Amount" with "1000"
        And I fill in "Description" with "test"
        When I press "Create Transaction"
        Then I should see "Transaction was successfully created."
        And I should be on the show transaction page