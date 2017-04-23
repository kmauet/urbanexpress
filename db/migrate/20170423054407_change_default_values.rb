class ChangeDefaultValues < ActiveRecord::Migration[5.0]
  def change
    change_column_default :invoices, :payed, from: nil, to: false
    change_column_default :invoices, :accepted, from: nil, to: false
    change_column_default :invoices, :emailsent, from: nil, to: false
    change_column_default :invoices, :total_collected, from: nil, to: 0
    change_column_default :invoices, :additional_charges, from: nil, to: 0
    change_column_default :invoices, :amount_due, from: nil, to: 0
    change_column_default :invoices, :deposit, from: nil, to: 0
    change_column_default :invoices, :sales_tax, from: nil, to: 0
    change_column_default :invoices, :rate, from: nil, to: 0
    change_column_default :invoices, :handicap_accessible, from: nil, to: false
  end
end
