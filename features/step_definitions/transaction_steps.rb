Given(/^From account "(.*?)" exist$/) do |accounts|
    accounts.split(", ").each do |account|
    Account.where("a_name = '"+ account +"'")
    # alternatively, using factory_girl 
    # Factory(:composer, :name => composer)
  end
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select("Bank", :from => field)
end

Given(/^To account "(.*?)" exist$/) do |accounts|
    accounts.split(", ").each do |account|
    Account.where("a_name = '"+ account +"'")
    end
end

When(/^I select "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  select(arg1, :from => arg2)
end


