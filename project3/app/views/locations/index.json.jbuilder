json.array!(@locations) do |location|
  json.extract! location, :id, :name, :lat_long
  json.url location_url(location, format: :json)
end
