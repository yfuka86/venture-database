class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.integer :amount
      t.integer :investor_id
      t.string :investor_type
      t.integer :investee_id
      t.string :investee_type

      t.timestamps null: false
    end
  end
end
