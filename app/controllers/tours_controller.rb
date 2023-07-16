class ToursController < ApplicationController
  before_action :set_tour, only: %i[map_locs geo_map show edit update destroy]
  before_action :set_story, only: %i[index new]

  # GET /tours or /tours.json
  def index
    @tours = Tour.where(story_id: @story.id)

    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: Tour.new, objects: @tours } }
    end
  end

  # GET /tours/1 or /tours/1.json
  def show
    @object = @tour
    @story = @tour.story

    @grid = ItinerariesGrid.new(itinerary_grid_params) do |scope|
      scope.joins(:city).where('itineraries.tour_id = ?', @tour.id)
    end
    @pagy, @records = pagy(@grid.assets)

    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @tour, new_link_name: 'add_city_link', new_link_path: 'cities' } }
    end
  end

  def sort
    if request.xhr?
      @tour = Tour.find(params[:tour_id])
      @tour.set_list_position(params[:tour][:position].to_i)
      @tour.save
      render body: nil
    else
      @story = Story.find(params[:story_id])
      @tours = @story.tours.order(:position)
      respond_to do |format|
        format.turbo_stream { render "shared/sort", locals: { return_path: @story, link_object: @story, object: Tour.new, objects: @tours } }
      end
    end
  end

  def map_locs
    respond_to do |format|
      format.json { render json: @tour.map_locs }
    end
  end

  def geo_map
    @object = @tour
    @story = @tour.story

    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @tour, no_new_link: true, part: 'map', path_name: 'shared' } }
    end
  end

  # GET /tours/new
  def new
    @tour = Tour.new
    @tour.story = @story
  end

  # GET /tours/1/edit
  def edit
    @short = params[:short]
    @story = @tour.story
  end

  # POST /tours or /tours.json
  def create
    @tour = Tour.new(tour_params)
    @story = @tour.story
    @short = params[:short]

    respond_to do |format|
      if @tour.save
         @tours = Tour.where(story_id: @story.id)
#        format.html { redirect_to tour_path(@tour), notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
        flash.now[:notice] = "Tour was successfully created."
        format.turbo_stream { render "shared/index", locals: { object: Tour.new, objects: @tours } }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1 or /tours/1.json
  def update
    @short = params[:short]
    @story = @tour.story
    @tours = Tour.where(story_id: @story.id)
    @grid = ItinerariesGrid.new(itinerary_grid_params) do |scope|
      scope.joins(:city).where('itineraries.tour_id = ?', @tour.id)
    end
    @pagy, @records = pagy(@grid.assets)
    respond_to do |format|
      if @tour.update(tour_params)
#        format.html { redirect_to tour_path(@tour), notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
        flash.now[:notice] = "Tour was successfully updated."
        format.turbo_stream { render "shared/update", locals: { object: @tour, short: @short } }
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
    @tours = Tour.where(story_id: @story.id)
    respond_to do |format|
      format.html { redirect_to story_tours_url(@story), notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
      flash.now[:now] = "Tour was successfully destroyed."
      format.turbo_stream { render "shared/destroy", locals: { object: Tour.new } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tour
    @tour = Tour.find(params[:id].nil? ? params[:tour_id] : params[:id])
  end

  def set_story
    @story = Story.find(params[:story_id])
  end

  def itinerary_grid_params
    params.fetch(:itineraries_grid, { order: :position, descending: false }).permit!
  end

  # Only allow a list of trusted parameters through.
  def tour_params
    params.require(:tour).permit(:story_id, :name, :summary, :tour_type)
  end
end
