class Vehicule < ApplicationRecord
  has_many :vehicule_images, dependent: :destroy
  has_many :invoices
  has_many :quotes
  accepts_nested_attributes_for :vehicule_images, reject_if: proc { |attributes| attributes[:photo].blank? }, allow_destroy: true

  enum vehicule_types: [:shuttle, :limousine, :sedan, :bus]
  validates_presence_of :vehicule_type
  mount_uploader :display_image, ImageUploader

  def amenities
    items = []
    items << "tv" if tv
    items << "bathroom" if bathroom
    items << "dvd_player" if dvd_player
    items << "cd_player" if cd_player
    items << "am_fm_radio" if am_fm_radio
    items << "cooler" if cooler
    items << "nav_system" if nav_system
    items << "sound_system" if sound_system
    items << "wheelchair" if wheelchair
    items << "bluetooth" if bluetooth
    items << "leather" if leather
    items << "seats" unless seats.nil?

    items
  end
end
