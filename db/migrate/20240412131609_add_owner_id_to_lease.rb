class AddOwnerIdToLease < ActiveRecord::Migration[7.1]
  def change
    add_reference :leases, :owner, foreign_key:true
  end
end
