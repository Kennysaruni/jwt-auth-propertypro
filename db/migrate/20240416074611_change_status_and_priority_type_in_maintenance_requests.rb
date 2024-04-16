class ChangeStatusAndPriorityTypeInMaintenanceRequests < ActiveRecord::Migration[7.1]
  def change
    change_column :maintenance_requests, :status, :string
    change_column :maintenance_requests, :priority, :string
  end
end
