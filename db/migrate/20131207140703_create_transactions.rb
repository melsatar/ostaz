class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :from_account_id
      t.integer :to_account_id
      t.float :t_amount
      t.date :t_date
      t.text :t_desc

      t.timestamps
    end
  end
end
