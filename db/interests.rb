require 'rdf'
require 'rdf/raptor'
require 'rdf/turtle'
require 'zlib'

include RDF

fp = File.expand_path(File.join(File.dirname(__FILE__),'subjects.ttl.gz'))
tmp_fp = File.expand_path(File.join(File.dirname(__FILE__), '../tmp/subjects.ttl'))

Zlib::GzipReader.open(fp) do |gz|
  File.open(tmp_fp, "w") do |g|
    IO.copy_stream(gz, g)
  end
end

puts tmp_fp

RDF::Reader.open(tmp_fp) do | reader |
  reader.each_statement do | statement |
    s,p,o = statement.to_triple
    puts o.to_s
    Interest.create(label: o.to_s, uri: s.to_s)
  end
end

File.delete(tmp_fp)

# gzopen seems to clash rdf-raptor somehow; this would be the preferred method:

# require rdf/gzip
# require 'rdf'
# require 'rdf/raptor'

# RDF::Reader.for(:turtle).gzopen("subjects.ttl.gz") do | reader |
#   reader.each_statement do | statement |
#     s,p,o = statement.to_triple
#     puts o.to_s
#     Interest.new(label: o.to_s, uri: s.to_s)
#   end
# end
