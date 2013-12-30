Feature: adding an account
 
  As an accountant
  So that I can quickly add account
  I want to see the added account

Scenario: adding an account
	Given I am a new, authenticated user
        Given I am on the homepage
        And I follow "New Account"
	Then I should be on the new account page
	And I fill in "account_a_name" with "Test Account"
        Given Account type "Expense, Asset" exist
	When I select "Asset" from "account_a_type"
        And I fill in "account_a_amount" with "1000"
        When I press "Create Account"
        Then I should see "Account was successfully created."
   
