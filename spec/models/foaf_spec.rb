require 'spec_helper'
require 'rdf'

include RDF

describe Foaf do

  let(:valid_attributes) { { 
    name: 'Jon Stroop',
    work: 'http://library.princeton.edu',
    slug: 'jstroop',
    birthday: '1977-06-16',
  } }

  doc_uri = "http://localhost/foafs/jstroop"

  describe '#to_graph' do
    it 'populates a graph with our attributes' do
      @foaf = Foaf.create! valid_attributes
      graph = @foaf.to_graph(doc_uri)

      work_triple = [
        RDF::URI.new('http://localhost/foafs/jstroop#me'),
        RDF::URI.new('http://xmlns.com/foaf/0.1/workInfoHomepage'),
        RDF::URI.new('http://library.princeton.edu')
      ]
      
      bday_triple = [
        RDF::URI.new('http://localhost/foafs/jstroop#me'),
        RDF::URI.new('http://xmlns.com/foaf/0.1/birthday'),
        RDF::Literal.new("1977-06-16", :datatype => RDF::XSD.date)
      ]

      graph.query(work_triple).should be_true
      graph.query(bday_triple).should be_true

    end
  end

  describe '#to_doc_graph' do
    it 'populates a graph with our attributes' do
      @foaf = Foaf.create! valid_attributes
      graph = @foaf.to_doc_graph(doc_uri)

      doc_type_triple = [
        RDF::URI.new('http://localhost/foafs/jstroop'),
        RDF::URI.new('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'),
        RDF::URI.new('http://xmlns.com/foaf/0.1/PersonalProfileDocument')
      ]

      graph.query(doc_type_triple).should be_true

    end
  end

end
