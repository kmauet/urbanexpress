class AddUnitToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :unit, :string
  end
end
