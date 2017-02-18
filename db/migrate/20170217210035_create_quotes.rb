class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :service_type
      t.string :vehicule_type
      t.integer :number_of_people

      t.timestamps
    end
  end
end
