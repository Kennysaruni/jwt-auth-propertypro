class AddOwnerIdToProperties < ActiveRecord::Migration[7.1]
  def change
    add_reference :properties, :owner, foreign_key:true
  end
end
