json.array!(@locations) do |location|
  json.extract! location, :id, :user_id, :name, :lat, :long, :woeid
  json.url location_url(location, format: :json)
end
