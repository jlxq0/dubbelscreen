json.array!(@people) do |person|
  json.extract! person, :id, :user_id, :name, :fullname, :birthday, :withings_id, :withings_key, :withings_secret
  json.url person_url(person, format: :json)
end
