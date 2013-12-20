# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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




