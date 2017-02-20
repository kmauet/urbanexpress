json.extract! message, :id, :body, :quote_id, :created_at, :updated_at
json.url message_url(message, format: :json)