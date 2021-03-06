# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#I18n.enforce_available_locales = false

Account.create(a_name: "Bank", a_type: "Asset", a_amount: 50000)
Account.create(a_name: "Cash", a_type: "Asset", a_amount: 0.0)
Account.create(a_name: "Equipment", a_type: "Asset", a_amount: 0.0)
Account.create(a_name: "Accounts Receivable", a_type: "Asset", a_amount: 0.0)
Account.create(a_name: "Accounts Payable", a_type: "Liability", a_amount: 0.0)
Account.create(a_name: "Dept", a_type: "Liability", a_amount: 0.0)
Account.create(a_name: "Office Expenses", a_type: "Expense", a_amount: 0.0)
Account.create(a_name: "Project Expenses", a_type: "Expense", a_amount: 0.0)
Account.create(a_name: "Capital", a_type: "Equity", a_amount: 50000.0)
Account.create(a_name: "Revenue", a_type: "Equity", a_amount: 0.0)
Role.create(name: "admin", title: "admin", description: "Manage Every thing", the_role: "{\"system\":{\"administrator\":true}}")
Role.create(name: "Accountant", title: "Accountant", description: "Accountant authorization", the_role: "{\"accounts\":{\"index\":true,\"edit\":true,\"show\":true,\"new\":true,\"create\":true}}")
Role.create(name: "Data_Entry", title: "Data_Entry", description: "Data Entry authorization", the_role: "{\"accounts\":{\"index\":true,\"edit\":false,\"show\":true,\"new\":false,\"create\":false},\"transactions\":{\"index\":true,\"edit\":false,\"show\":true,\"new\":false,\"create\":false}}")

user = User.new
user.email = "admin@ostaz.com"
user.password= "12345678"
user.password_confirmation = "12345678"
user.save!
User.first.update( role: Role.with_name(:admin) )

user1 = User.new
user1.email = "accountant@ostaz.com"
user1.password= "12345678"
user1.password_confirmation = "12345678"
user1.save!

accountant = User.find_by :email => "accountant@ostaz.com"
accountant.update( role: Role.with_name(:Accountant) )

user2 = User.new
user2.email = "entry@ostaz.com"
user2.password= "12345678"
user2.password_confirmation = "12345678"
user2.save!

entry = User.find_by :email => "entry@ostaz.com"
entry.update( role: Role.with_name(:Data_Entry) )



