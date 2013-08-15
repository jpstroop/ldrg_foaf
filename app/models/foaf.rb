require 'uri'
require 'rdf'
require 'linkeddata'

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



  doc_uri = RDF::URI.new("#{Rails.application.routes.url_helpers.foafs_path}/#{:slug}")
  my_uri = doc_uri.join('#me')

  def to_graph
    graph = RDF::Graph.new do
      
      # # the doc
      # self << RDF::Statement.new(doc, RDF.type, RDF::FOAF.PersonalProfileDocument)
      # self << RDF::Statement.new(doc, RDF::FOAF.primaryTopic, me)
      # self << RDF::Statement.new(doc, RDF::DC.modified, Time.now.utc.strftime("%Y-%m-%dT%H:%M:%S.%LZ"))

      # me
      me = uris[:jstroop]
      self << RDF::Statement.new(me, RDF.type, RDF::FOAF.Person)
      self << [me, RDF::FOAF.name, name]
      self << [me, RDF::FOAF.birthday, bday]
      self << [me, RDF::FOAF.workInfoHomepage, work]
      schools.each { |s| self << [me, RDF::FOAF.schoolHomepage, RDF::URI.new(s)] }
      interests.each { |i| self << [me, RDF::FOAF.interest, RDF::URI.new(i)] }
    end
    graph
  end

  def to_doc_graph
      graph = RDF::Graph.new do
      
      doc 
      # self << RDF::Statement.new(doc, RDF.type, RDF::FOAF.PersonalProfileDocument)
      # self << RDF::Statement.new(doc, RDF::FOAF.primaryTopic, me)
      # self << RDF::Statement.new(doc, RDF::DC.modified, Time.now.utc.strftime("%Y-%m-%dT%H:%M:%S.%LZ"))

    end
    graph
  end

end
