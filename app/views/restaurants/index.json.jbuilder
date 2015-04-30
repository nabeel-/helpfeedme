json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :description, :chain_id, :rating, :price
  json.url restaurant_url(restaurant, format: :json)
end
