class AddFieldsToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoices, :user, foreign_key: true
    add_column :invoices, :date_needed, :date
    add_column :invoices, :date_reserved, :date
    add_column :invoices, :time_reserved, :time
    add_column :invoices, :first_name, :string
    add_column :invoices, :last_name, :string
    add_column :invoices, :phone, :string
    add_column :invoices, :email, :string
    add_reference :invoices, :vehicule, foreign_key: true
    add_column :invoices, :itinerary, :text
    add_column :invoices, :handicap_accessible, :boolean
    add_column :invoices, :public_availability, :boolean
    add_column :invoices, :method_of_pay, :string
    add_column :invoices, :rate, :float
    add_column :invoices, :sales_tax, :float
    add_column :invoices, :deposit, :float
    add_column :invoices, :amount_due, :float
    add_column :invoices, :additional_charges, :float
    add_column :invoices, :total_collected, :float
    add_column :invoices, :accepted, :boolean
    add_column :invoices, :payed, :boolean
  end
end
