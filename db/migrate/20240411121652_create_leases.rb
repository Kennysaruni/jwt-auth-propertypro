class CreateLeases < ActiveRecord::Migration[7.1]
  def change
    create_table :leases do |t|
      t.references :tenant, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
