require 'rdf'
require 'linkeddata'

class FoafsController < ApplicationController
  before_action :set_foaf, only: [:show, :edit, :update, :destroy]

  # GET /foafs
  # GET /foafs.json
  def index
    @foafs = Foaf.all
    # if all else fails, make RDF them
    # rapper -o dot -i turtle me.ttl | dot -Tsvg -o me.svg
  end

  # GET /foafs/1
  # GET /foafs/1.json
  def show
      # @foaf = Foaf.find(:id)
    respond_to do |format|
      format.html
      format.ttl { render text: convert_to_ttl(@foaf) }
    end
  end

  def convert_to_ttl(foaf) 
    uri = "http://#{request.host}#{request.fullpath}"
    output = RDF::Turtle::Writer.buffer(prefixes: Foaf::PREFIXES) do |writer|
      foaf.to_doc_graph(uri).each_statement do |statement|
        writer << statement
      end
    end
  end
      # see: http://stackoverflow.com/a/4500343/714478

      # also: http://apidock.com/rails/ActionController/MimeResponds/InstanceMethods/respond_to
      # If you need to use a MIME type which isn’t supported by default, you 
      # can register your own handlers in environment.rb as follows:

      # Mime::Type.register "image/jpg", :jpg

      # USE WRITERS EXPLICITLY, don't look them up!
      # output = RDF::Turtle::Writer.buffer(prefixes: Foaf::PREFIXES) do |writer|
      #   graph.each_statement do |statement|
      #     writer << statement
      #   end
      # end


  # GET /foafs/new
  def new
    @foaf = Foaf.new
    # 2.times { @foaf.interests.build }
    1.times { @foaf.interests.build }
  end

  # GET /foafs/1/edit
  def edit
    1.times { @foaf.interests.build }
  end

  # POST /foafs
  # POST /foafs.json
  def create

    # Rails.logger.warn "===================="
    # Rails.logger.warn foaf_params[:interests_attributes]
    # Rails.logger.warn "===================="

    
    @foaf = Foaf.new(name: foaf_params[:name], work: foaf_params[:work], 
      slug: foaf_params[:slug], birthday: foaf_params[:birthday])

    if(foaf_params.has_key?(:interests_attributes))
      foaf_params[:interests_attributes]["0"][:id].each do |i|
        @foaf.interests << Interest.find(i)
      end
    end

    respond_to do |format|
      if @foaf.save 
        format.html { redirect_to @foaf, notice: 'Foaf was successfully created.' }
        format.json { render action: 'show', status: :created, location: @foaf }
      else
        format.html { render action: 'new' }
        format.json { render json: @foaf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foafs/1
  # PATCH/PUT /foafs/1.json
  def update

    @foaf.interests.clear

    if(foaf_params.has_key?(:interests_attributes))
      foaf_params[:interests_attributes]["0"][:id].each do |i|
        @foaf.interests << Interest.find(i)
      end
    end

    respond_to do |format|
      if @foaf.update(foaf_params)
        format.html { redirect_to @foaf, notice: 'Foaf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @foaf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foafs/1
  # DELETE /foafs/1.json
  def destroy
    @foaf.destroy

    respond_to do |format|
      format.html { redirect_to foafs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foaf
      @foaf = Foaf.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foaf_params
      params.require(:foaf).permit(:name, :work, :slug, :birthday, interests_attributes: [ { id: [] } ])
    end
end
