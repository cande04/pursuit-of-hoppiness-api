class BreweriesController < ProtectedController
  before_action :set_brewery, only: %i[show update destroy]
  skip_before_action :authenticate, only: %i[search_breweries]

  # GET /breweries
  def index
    @breweries = current_user.breweries

    render json: @breweries
  end

  # GET /breweries/1
  def show
    render json: @brewery
  end

  # POST /breweries
  def create
    @brewery = current_user.breweries.build(brewery_params)

    if @brewery.save
      render json: @brewery, status: :created, location: @brewery
    else
      render json: @brewery.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /breweries/1
  def update
    if @brewery.update(brewery_params)
      render json: @brewery
    else
      render json: @brewery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /breweries/1
  def destroy
    @brewery.destroy
  end

  # GET from yelp search
  def search_breweries
    search_breweries = params.require(:searchBreweries)
    render json: HTTParty.get("https://api.yelp.com/v3/businesses/search?limit=50&categories=breweries&location=#{search_breweries}", :headers => { "Authorization" => "Bearer BYMafyqzCQkJhfTPrbLBOs6G3-j4gj3KBoPF5UPhcz-MBkDp0jnixEW6DoFYN0BhefpcpOF7KgyYXal86ilUPJVxYpsC36oWzj2N1RXL4vrD65EOT1JFnIot4lg3XXYx"})
    puts("apikey: #{ENV["YELP_API_KEY"]}")
  end

  def fetch_brewery
    brewery_db_id = params.require(:breweryId)
    render json: HTTParty.get("https://api.yelp.com/v3/businesses/#{brewery_db_id}", :headers => { "Authorization" => "Bearer BYMafyqzCQkJhfTPrbLBOs6G3-j4gj3KBoPF5UPhcz-MBkDp0jnixEW6DoFYN0BhefpcpOF7KgyYXal86ilUPJVxYpsC36oWzj2N1RXL4vrD65EOT1JFnIot4lg3XXYx"})
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_brewery
    @brewery = Brewery.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def brewery_params
    params.require(:brewery).permit(:name, :location, :rating, :review, :image_url)
  end

  private :set_brewery, :brewery_params
end
