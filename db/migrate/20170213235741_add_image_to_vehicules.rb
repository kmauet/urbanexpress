class AddImageToVehicules < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicules, :display_image, :string
  end
end
