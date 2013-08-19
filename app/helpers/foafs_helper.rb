module FoafsHelper
  
  def uri_from_foaf(f)
    current_uri = RDF::URI.new("http://#{request.host}#{request.fullpath}")
    path = Foaf.strip_extension_from_uri(current_uri)
   "#{path}/#{f.slug}#me"
  end

  def shorten_namespace(uri)
    ns = Foaf::PREFIXES.select{ |k,v| uri.to_s.start_with? v }
    if ns.length == 1
      uri.to_s.sub(ns[ns.keys[0]], "#{ns.keys[0]}:")
    else
      uri.to_s
    end
  end

end
