json.extract! food, :id, :name, :measurementUnit, :Price, :created_at, :updated_at
json.url food_url(food, format: :json)
