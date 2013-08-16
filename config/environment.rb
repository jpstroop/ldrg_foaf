# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
LdrgFoaf::Application.initialize!

# see http://blog.datagraph.org/2010/04/parsing-rdf-with-ruby
Mime::Type.register "text/turtle", :ttl
Mime::Type.register "text/plain", :nt
Mime::Type.register "application/rdf+xml", :rdf
Mime::Type.register "application/rdf+json", :rj
Mime::Type.register "application/ld+json", :jsonld
