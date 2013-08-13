json.array!(@foafs) do |foaf|
  json.extract! foaf, :name, :work
  json.url foaf_url(foaf, format: :json)
end
