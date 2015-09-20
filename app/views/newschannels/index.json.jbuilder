json.array!(@newschannels) do |newschannel|
  json.extract! newschannel, :id, :user_id, :name, :feedurl
  json.url newschannel_url(newschannel, format: :json)
end
