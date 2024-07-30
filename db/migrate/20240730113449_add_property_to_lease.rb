class AddPropertyToLease < ActiveRecord::Migration[7.1]
  def change
    add_reference :leases, :property, foreign_key:true
  end
end
