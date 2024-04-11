class CreateUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :units do |t|
      t.references :property, null: false, foreign_key: true
      t.string :type
      t.decimal :rent_amount
      t.integer :rooms
      t.integer :bathrooms

      t.timestamps
    end
  end
end
