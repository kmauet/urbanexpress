class AddGriddlerHashToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :email_hash, :text
  end
end
