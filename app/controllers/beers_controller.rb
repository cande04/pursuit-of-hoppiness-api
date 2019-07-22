# frozen_string_literal: true

require 'httparty'

class BeersController < ProtectedController
  before_action :set_beer, only: %i[show update destroy]
  skip_before_action :authenticate, only: %i[search_beer]

  # GET /beers
  def index
    @beers = current_user.beers

    render json: @beers
  end

  # GET /beers/1
  def show
    render json: @beer
  end

  # POST /beers
  def create
    @beer = current_user.beers.build(beer_params)

    if @beer.save
      render json: @beer, status: :created, location: @beer
    else
      render json: @beer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /beers/1
  def update
    if @beer.update(beer_params)
      render json: @beer
    else
      render json: @beer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /beers/1
  def destroy
    @beer.destroy
  end

  # GET from brewerydb search
  def search_beer
    search_beer = params.require(:searchBeer)
    render json: HTTParty.get("https://sandbox-api.brewerydb.com/v2/search/?key=0576184734503e9f155dc843e0c48342&type=beer&q=#{search_beer}")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_beer
    @beer = current_user.beers.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def beer_params
    params.require(:beer).permit(:name, :style, :abv, :description, :brewery, :brewery_location, :rating, :review)
  end

  private :set_beer, :beer_params
end
