class CreateAcquisitions < ActiveRecord::Migration
  def change
    create_table :acquisitions do |t|
      t.integer :parent_id
      t.integer :child_id
      t.integer :amount

      t.timestamps null: false
    end
  end
end
