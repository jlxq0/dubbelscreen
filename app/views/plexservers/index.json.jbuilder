json.array!(@plexservers) do |plexserver|
  json.extract! plexserver, :id, :user_id, :name, :url, :port, :token, :shows_library, :movies_library
  json.url plexserver_url(plexserver, format: :json)
end
