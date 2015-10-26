json.array!(@playlists) do |playlist|
  json.extract! playlist, :id, :name, :description, :references
  json.url playlist_url(playlist, format: :json)
end
