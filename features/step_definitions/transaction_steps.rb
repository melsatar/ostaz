Given /^the following accounts$/ do |accounts|
     Account.create(accounts.hashes)
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end

