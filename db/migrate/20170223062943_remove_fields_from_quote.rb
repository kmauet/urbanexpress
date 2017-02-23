class RemoveFieldsFromQuote < ActiveRecord::Migration[5.0]
  def change
    remove_column :quotes, :vehicule_type, :string
    remove_column :quotes, :number_of_people, :string
  end
end
