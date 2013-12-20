Given /^the following accounts$/ do |accounts|
     Account.create(accounts.hashes)
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  @account = ""
  Account.select(:a_name).where("a_name= '" + value + "'").each do |account|
  @account = account.a_name
  end
  select(@account, :from => field)
end

