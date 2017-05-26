class AddActiveFlagToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :active, :boolean, default: true
  end
end
