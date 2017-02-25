class CreateVehiculeImages < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicule_images do |t|
      t.integer :vehicule_id
      t.string :photo

      t.timestamps
    end
  end
end
