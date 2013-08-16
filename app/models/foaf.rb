require 'rdf'
require 'linkeddata'
require 'uri'

class Foaf < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug, use: :slugged

  PREFIXES = {
    foaf: RDF::FOAF.to_uri,
    rdf: RDF.to_uri,
    rdfs: RDF::RDFS.to_uri,
    xsd: RDF::XSD.to_uri,
    dc: RDF::DC.to_uri
  }

  LD_GROUP_URI = RDF::URI.new('http://library.princeton.edu/ld_group')


  has_and_belongs_to_many :interests, autosave: false
  accepts_nested_attributes_for :interests

  validates :name, :work, :slug, :birthday, presence: true

  # validates :slug, 

  validates :work, allow_blank: true, format: {
    with: URI::regexp,
    message: 'must be a valid URI.'
  }

  validates :slug, uniqueness: true, format: {
    with: /\A[[a-z]]{1,}\z/,
    message: 'may only consist of lowercase letters and no spaces'
  }

  def to_graph(your_uri)

    me = RDF::URI.new(your_uri)

    graph = RDF::Graph.new

    graph << RDF::Statement.new(me, RDF.type, RDF::FOAF.Person)
    graph << [me, RDF::FOAF.name, self.name]
    graph << [me, RDF::FOAF.birthday, self.birthday]
    graph << [me, RDF::FOAF.workInfoHomepage, RDF::URI.new(self.work)]

    self.interests.each do |i| 
      graph << [me, RDF::FOAF.interest, RDF::URI.new(i.uri)]
    end
    graph
  end

  def to_doc_graph(doc_uri)

    doc_uri = RDF::URI.new(doc_uri)

    if doc_uri.basename.include? '.'
      # subject_uri = doc_uri.join('#me')
      dot_tokens = doc_uri.to_s.split('.')
      dot_tokens.pop
      subject_uri = RDF::URI.new(dot_tokens.join('.')).join('#me')
    else
      subject_uri = doc_uri.join('#me')
    end 

    graph = RDF::Graph.new
    graph << [doc_uri, RDF.type, RDF::FOAF.PersonalProfileDocument]
    graph << [doc_uri, RDF::FOAF.primaryTopic, subject_uri]
    graph << [doc_uri, RDF::DC.modified, DateTime.parse(self.updated_at.to_s)]

    graph << self.to_graph(subject_uri)

    graph
  end

end
