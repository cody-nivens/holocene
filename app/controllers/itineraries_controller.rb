class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: %i[ show edit update destroy ]
  before_action :set_tour, only: %i[ index new create show edit update destroy ]
  before_action :set_story, only: %i[ index new create show edit update destroy ]

  # GET /itineraries or /itineraries.json
  def index
    unless params[:itineraries_grid].blank?
      params[:itineraries_grid].delete(:activated)
      params[:itineraries_grid].delete(:seen)
      params[:itineraries_grid].delete(:tour_id)
    end

    @grid = ItinerariesGrid.new(itinerary_grid_params) do |scope|
      scope.where("itineraries.tour_id = ?", @tour.id)
    end
    @pagy, @records = pagy(@grid.assets)
  end

  # GET /itineraries/1 or /itineraries/1.json
  def show
  end

  # GET /itineraries/new
  def new
    @itinerary = Itinerary.new
    @itinerary.tour = @tour
    @cities = City.all.order(:name)
  end

  # GET /itineraries/1/edit
  def edit
    @cities = City.all.order(:name)
  end

  # POST /itineraries or /itineraries.json
  def create
    @itinerary = Itinerary.new(itinerary_params)

    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to story_tour_itinerary_path(@story,@tour,@itinerary), notice: "Itinerary was successfully created." }
        format.json { render :show, status: :created, location: @itinerary }
      else
        format.html { 
          @cities = City.all.order(:name)
          render :new, status: :unprocessable_entity
        }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itineraries/1 or /itineraries/1.json
  def update
    respond_to do |format|
      if @itinerary.update(itinerary_params)
        format.html { redirect_to story_tour_itinerary_path(@story,@tour,@itinerary), notice: "Itinerary was successfully updated." }
        format.json { render :show, status: :ok, location: @itinerary }
      else
        format.html {
          @cities = City.all.order(:name)
          render :edit, status: :unprocessable_entity
        }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries/1 or /itineraries/1.json
  def destroy
    @itinerary.destroy
    respond_to do |format|
      format.html { redirect_to story_tour_itineraries_url(@story,@tour), notice: "Itinerary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    def set_tour
      @tour = Tour.find(params[:tour_id])
    end

    def set_story
      @story = Story.find(params[:story_id])
    end

    def itinerary_grid_params
      params.fetch(:itineraries_grid, { :order => :name, :descending => false}).permit!
    end

    # Only allow a list of trusted parameters through.
    def itinerary_params
      params.require(:itinerary).permit(:name, :tour_id, :city_id, :position, :stay, :summary, :intructions)
    end
end
