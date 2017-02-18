class AddSeatsToVehicules < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicules, :seats, :string
  end
end
