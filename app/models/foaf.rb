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


  # def doc_uri 
  #   "#{Rails.application.routes.url_helpers.foafs_path}/#{slug}"
  #   # RDF::URI.new("http://#{request.host}{request.fullpath}")
  # end

  # def my_uri 
  #   doc_uri.join('#me')
  # end

  def to_graph(your_uri)

    me = RDF::URI.new(your_uri)

    graph = RDF::Graph.new

    graph << RDF::Statement.new(me, RDF.type, RDF::FOAF.Person)
    graph << [me, RDF::FOAF.name, self.name]
    graph << [me, RDF::FOAF.birthday, self.birthday]
    graph << [me, RDF::FOAF.workInfoHomepage, RDF::URI.new(self.work)]

    self.interests.each { |i| graph << [me, RDF::FOAF.interest, RDF::URI.new(i)] }
    graph
  end

  def to_doc_graph(doc_uri)

    doc_uri = RDF::URI.new(doc_uri)
    subject_uri = doc_uri.join('#me')

    graph = RDF::Graph.new do
      self << RDF::Statement.new(doc_uri, RDF.type, RDF::FOAF.PersonalProfileDocument)
      self << RDF::Statement.new(doc_uri, RDF::FOAF.primaryTopic, subject_uri)
      self << RDF::Statement.new(doc_uri, RDF::DC.modified, Time.now.utc.strftime("%Y-%m-%dT%H:%M:%S.%LZ"))
    end

    graph << self.to_graph(subject_uri)

    graph
  end

end
