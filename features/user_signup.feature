Feature: User Signup
 
  As an new user
  So that I can signup and edit my user setting


Scenario Outline: Creating a new account
	Given I am not authenticated
	Then I should be on the register page
	And I fill in "user_email" with "<email>"
	And I fill in "user_password" with "<password>"
	And I fill in "user_password_confirmation" with "<password>"
	And I press "Sign up"
	Then I should see "Welcome! You have signed up successfully."

	Examples:
	| email           | password   |
	| testing@man.net | secretpass |
	| foo@bar.com     | 12345678   |

Scenario: Willing to edit my account
	Given I am a new, authenticated user
	And I follow "User Setting"
	Then I should be on the user setting page
	When I edit my account details
	Then I should see "You updated your account successfully."

