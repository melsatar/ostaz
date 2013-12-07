class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :a_name
      t.string :a_type
      t.float :a_amount

      t.timestamps
    end
  end
end
