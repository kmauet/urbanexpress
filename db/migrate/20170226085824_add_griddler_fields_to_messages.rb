class AddGriddlerFieldsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :to, :text
    add_column :messages, :from, :text
    add_column :messages, :cc, :text
    add_column :messages, :subject, :text
    add_column :messages, :raw_text, :text
    add_column :messages, :raw_html, :text
    add_column :messages, :raw_body, :text
    add_column :messages, :attachments, :text
    add_column :messages, :headers, :text
    add_column :messages, :raw_headers, :text
  end
end
