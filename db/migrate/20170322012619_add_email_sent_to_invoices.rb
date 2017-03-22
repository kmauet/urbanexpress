class AddEmailSentToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :emailsent, :boolean
  end
end
