class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :update, :destroy]

  # GET /apartments
  def index
    @apartments = Apartment.all

    render json: @apartments
  end

  # GET /apartments/1
  def show
    render json: @apartment
  end

  # POST /apartments
  def create
    @apartment = Apartment.create!(apartment_params)
    render json: @apartment, status: :created, location: @apartment
  end

  # PATCH/PUT /apartments/1
  def update
    @apartment.update!(apartment_params)
    render json: @apartment
  end

  # DELETE /apartments/1
  def destroy
    @apartment.destroy
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_apartment
    @apartment = Apartment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def apartment_params
    params.require(:apartment).permit(:number)
  end
end
