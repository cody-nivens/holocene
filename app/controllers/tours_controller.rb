class ToursController < ApplicationController
  before_action :set_tour, only: %i[ geo_map show edit update destroy ]
  before_action :set_story, only: %i[ index new ]

  # GET /tours or /tours.json
  def index
    @tours = Tour.where(story_id: @story.id)
  end

  # GET /tours/1 or /tours/1.json
  def show
    @object = @tour
    @story = @tour.story

    @grid = ItinerariesGrid.new(itinerary_grid_params) do |scope|
      scope.joins(:city).where("itineraries.tour_id = ?", @tour.id)
    end
    @pagy, @records = pagy(@grid.assets)
  end

  def geo_map
      @object = @tour
    @story = @tour.story
  end

  # GET /tours/new
  def new
    @tour = Tour.new
    @tour.story = @story
  end

  # GET /tours/1/edit
  def edit
    @story = @tour.story
  end

  # POST /tours or /tours.json
  def create
    @tour = Tour.new(tour_params)
    @story = @tour.story

    respond_to do |format|
      if @tour.save
        format.html { redirect_to tour_path(@tour), notice: "Tour was successfully created." }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1 or /tours/1.json
  def update
    @story = @tour.story
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to tour_path(@tour), notice: "Tour was successfully updated." }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1 or /tours/1.json
  def destroy
    @story = @tour.story
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to story_tours_url(@story), notice: "Tour was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    def set_story
      @story = Story.find(params[:story_id])
    end

    def itinerary_grid_params
      params.fetch(:itineraries_grid, { :order => :lng, :descending => false}).permit!
    end


    # Only allow a list of trusted parameters through.
    def tour_params
      params.require(:tour).permit(:story_id, :name, :summary)
    end
end
