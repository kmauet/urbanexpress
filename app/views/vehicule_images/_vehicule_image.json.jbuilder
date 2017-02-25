json.extract! vehicule_image, :id, :vehicule_id, :photo, :created_at, :updated_at
json.url vehicule_image_url(vehicule_image, format: :json)