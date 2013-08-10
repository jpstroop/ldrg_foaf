json.array!(@foafs) do |foaf|
  json.extract! foaf, :ident, :name, :work, :birthday
  json.url foaf_url(foaf, format: :json)
end
