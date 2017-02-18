class AddMeritFieldsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :sash_id, :integer
    add_column :customers, :level,   :integer, :default => 0
  end
end
