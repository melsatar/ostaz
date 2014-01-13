require 'simplecov'
SimpleCov.start


Given(/^I am not authenticated$/) do
  visit('/users/sign_up') # ensure that at least
end


When(/^I edit my account details$/) do
  fill_in "user_current_password", :with => "secretpass"
  fill_in "user_password", :with => "12345678"
  fill_in "user_password_confirmation", :with => "12345678"
  click_button "Update"
end

