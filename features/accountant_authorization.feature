Feature: Authorization
 
  As an Authorized accountant user
  So that I can only see the authorized pages


Scenario: viewing account and transaction
	Given I am an authenticated user, username is "accountant@ostaz.com" and password is "12345678"
        Given I am on the homepage
        And I follow "Transactions List"
	Then I should be on the transactions page   

Scenario: viewing Role Creation and Role Management
	Given I am an authenticated user, username is "accountant@ostaz.com" and password is "12345678"
        Given I am on the homepage
        And I follow "Role Creation"
	Then I should be on the homepage
	Then I should see "This user does not have the privilege to access this page"
	And I follow "Role Management"
	Then I should be on the homepage
	Then I should see "This user does not have the privilege to access this page"
