class AddDepositToUnit < ActiveRecord::Migration[7.1]
  def change
    add_column :leases, :deposit_amount, :decimal
  end
end
