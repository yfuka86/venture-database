class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.integer :company_id
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
