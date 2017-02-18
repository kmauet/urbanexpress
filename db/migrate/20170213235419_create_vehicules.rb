class CreateVehicules < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicules do |t|
      t.string :name
      t.string :vehicule_type
      t.text :info
      t.boolean :tv
      t.boolean :bathroom
      t.boolean :dvd_player
      t.boolean :cd_player
      t.boolean :am_fm_radio
      t.boolean :cooler
      t.boolean :nav_system
      t.boolean :sound_system
      t.boolean :wheelchair
      t.boolean :bluetooth
      t.boolean :leather

      t.timestamps
    end
  end
end
