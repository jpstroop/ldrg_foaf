json.array!(@interests) do |interest|
  json.extract! interest, :label, :uri
  json.url interest_url(interest, format: :json)
end
