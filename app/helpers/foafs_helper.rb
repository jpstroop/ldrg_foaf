module FoafsHelper
  
  def uri_from_foaf(f)
    current_uri = RDF::URI.new("http://#{request.host}#{request.fullpath}")
    path = Foaf.strip_extension_from_uri(current_uri)
   "#{path}/#{f.slug}#me"
  end

  def shorten_namespace(uri)
    Foaf::PREFIXES[:ldrg] = "http://#{request.host}#{foafs_path}/"
    ns = Foaf::PREFIXES.select{ |k,v| uri.to_s.start_with? v }
    if ns.length == 1
      uri.to_s.sub(ns[ns.keys[0]], "#{ns.keys[0]}:")
    else
      uri.to_s
    end
  end

  def foaf_array_to_graph(foafs)

    graph = RDF::Graph.new
    doc_uri = RDF::URI.new(request.url)
    stripped_uri = Foaf.strip_extension_from_uri(doc_uri)
    group_uri = stripped_uri.join('#us')
    graph << [group_uri, RDF.type, RDF::FOAF.Group]
    graph << [group_uri, RDF::FOAF.name, "PUL Linked Data Reading Group"]

    foafs.each do |f|
      foaf_uri = RDF::URI.new(uri_from_foaf(f)).join('#me')
      graph << [group_uri, RDF::FOAF.member, foaf_uri]
      graph << f.to_graph(foaf_uri)
    end

    if doc_uri != stripped_uri
      graph << [doc_uri, RDF::OWL.sameAs, stripped_uri]
    end

    graph

  end

end
