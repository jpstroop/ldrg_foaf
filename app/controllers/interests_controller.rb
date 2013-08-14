class InterestsController < ApplicationController
  # before_action :set_interest, only: [:show, :edit, :update, :destroy]

  # GET /interests
  # GET /interests.json

  def index
    @interests = Interest.where("label LIKE :prefix", prefix: "#{params[:starts_with]}%").limit(10)
    s = @interests.to_json only: [:label, :uri, :id]
    render json: "{ \"results\": #{s}, \"more\": false }"
  end

  # Used in loader task only!
  def create 
    @interest = Interest.new(interest_params)
    @interest.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest
      @interest = Interest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.require(:interest).permit(:label, :uri)
    end
end
