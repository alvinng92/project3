json.array!(@observations) do |observation|
  json.extract! observation, :id, :rain_since_9am, :temp, :dewpoint, :wind_dir, :wind_spd_kph, :location_id
  json.url observation_url(observation, format: :json)
end
