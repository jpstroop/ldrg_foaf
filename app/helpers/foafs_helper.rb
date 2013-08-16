module FoafsHelper
  
  def uri_from_foaf(f)
    current_uri = RDF::URI.new("http://#{request.host}#{request.fullpath}")
    path = Foaf.strip_extension_from_uri(current_uri)
   "#{path}/#{f.slug}#me"
  end

end
