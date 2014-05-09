json.array!(@sounds) do |sound|
  json.extract! sound, :id, :name, :image_url, :url
  json.url sound_url(sound, format: :json)
end
