class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.integer :price
      t.string :permalink
      t.string :name
      t.references :quote, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
