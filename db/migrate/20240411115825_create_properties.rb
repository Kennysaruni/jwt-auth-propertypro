class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :property_name
      t.string :location

      t.timestamps
    end
  end
end
