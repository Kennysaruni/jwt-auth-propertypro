class CreateMaintenanceRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :maintenance_requests do |t|
      t.references :unit, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :status, default: 0
      t.integer :priority

      t.timestamps
    end
  end
end
