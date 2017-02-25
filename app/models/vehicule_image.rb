class VehiculeImage < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :vehicule
end
