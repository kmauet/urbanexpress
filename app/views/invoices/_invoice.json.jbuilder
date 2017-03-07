json.extract! invoice, :id, :price, :permalink, :name, :quote_id, :customer_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)