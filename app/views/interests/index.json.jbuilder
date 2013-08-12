json.array!(@interests) do |interest|
  json.extract! interest, :label, :uri, :foaf_id
  json.url interest_url(interest, format: :json)
end
