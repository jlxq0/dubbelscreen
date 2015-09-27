json.array!(@datasources) do |datasource|
  json.extract! datasource, :id, :name, :datasourcetype_id
  json.url datasource_url(datasource, format: :json)
end
