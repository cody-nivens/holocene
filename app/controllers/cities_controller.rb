class CitiesController < ApplicationController
  before_action :set_city, only: %i[ show edit update destroy ]
  before_action :set_tour, only: %i[ index add_city ]

  # GET /cities or /cities.json
  def index
    @command = "Add City"

    unless params[:cities_grid].blank?
      params[:cities_grid].delete(:activated)
      params[:cities_grid].delete(:seen)
      params[:cities_grid].delete(:tour_id)
    end

    @grid = CitiesGrid.new(grid_params.merge({:tour => @tour}))
    @pagy, @records = pagy(@grid.assets)
  end

  def itinerary
    @cities = []
    if !params[:city].nil? && !params[:city][:activated].empty?
      params[:city][:activated].each do |he_id|
        next if he_id.blank?
        he = City.find(he_id)
        @cities << he
      end
    end
  end

  def add_city
    @command = "Add Cities"
    @grid = CitiesGrid.new(grid_params.merge({:tour => @tour}))
    @pagy, @records = pagy(@grid.assets)
    respond_to do |format|
        format.html { render :index }
    end
  end

    def tours
      @tour = Tour.find(params[:city][:tour_id])

      params[:city][:activated].each do |he_id|
          case params[:commit]
          when "Add Cities"
            city = City.find(he_id)
            itinerary = Itinerary.create({name: city.name, city_id: city.id, tour_id: @tour.id})
            @tour.itineraries << itinerary
          else
          #when "Delete Cities"
          end
      end
      respond_to do |format|
        format.html {
          redirect_to tour_path(@tour),
                                :notice => "Tour was successfully updated"
        }
        format.json { render :show, status: :created, location: @city }
      end
  end



  # GET /cities/1 or /cities/1.json
  def show
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities or /cities.json
  def create

    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: "City was successfully created." }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1 or /cities/1.json
  def update

    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: "City was successfully updated." }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1 or /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: "City was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    def set_tour
      @tour = nil
      if params[:tour_id].blank? && !params[:cities_grid].blank? && !params[:cities_grid][:tour_id].blank?
        @tour = Tour.find(params[:cities_grid][:tour_id])
      elsif !params[:tour_id].blank?
        @tour = Tour.find(params[:tour_id])
      end
    end

    def grid_params
      params.fetch(:cities_grid, {:order => :name, :descending => false}).permit!
    end

    # Only allow a list of trusted parameters through.
    def city_params
      params.require(:city).permit(:name, :name_ascii, :lat, :lng, :country, :iso2, :iso3, :admin_name, :capital, :population, :simple_map_id, :tour_id)
    end
end
