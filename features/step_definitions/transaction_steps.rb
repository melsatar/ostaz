Given(/^From account "(.*?)" exist$/) do |accounts|
    #accounts.split(", ").each do |account|
    #Account.where("a_name = '"+ account +"'")
    #accounts = {"Cash"=>"1","Bank"=>"2"}
    # alternatively, using factory_girl 
    # Factory(:composer, :name => composer)
    accounts = Account.select(:id)
   
  #end
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  #transaction_from_account_id = Account.select(:id)
  select(1, :from => field)
end

Given(/^To account "(.*?)" exist$/) do |accounts|
    accounts.split(", ").each do |account|
    Account.where("a_name = '"+ account +"'")
    end
end

When(/^I select "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  select(arg1, :from => arg2)
end


