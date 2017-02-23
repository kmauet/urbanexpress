class AddFieldsToQuote < ActiveRecord::Migration[5.0]
  def change
    add_column :quotes, :type, :string
    add_column :quotes, :customer_id, :integer
    add_column :quotes, :organization, :string
    add_column :quotes, :address, :string
    add_column :quotes, :extension, :string
    add_column :quotes, :departure_date, :date
    add_column :quotes, :departure_time, :time
    add_column :quotes, :departure_address, :string
    add_column :quotes, :destination_address, :string
    add_column :quotes, :vehicule_type, :integer
    add_column :quotes, :itinirary, :text
    add_column :quotes, :additional_notes, :text
    add_column :quotes, :total_num_of_days, :integer
    add_column :quotes, :return_date, :date
    add_column :quotes, :return_time, :time
    add_column :quotes, :num_of_passengers, :integer
    add_column :quotes, :num_of_bags, :integer
    add_column :quotes, :airport, :string
    add_column :quotes, :flight_num, :string
    add_column :quotes, :pay_method, :string
    add_column :quotes, :flight_departure_time, :time
  end
end
