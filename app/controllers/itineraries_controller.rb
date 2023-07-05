class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: %i[map_locs show edit update destroy]
  before_action :set_tour, only: %i[index new]

  # GET /itineraries or /itineraries.json
  def index
    if params[:itineraries_grid].present?
      params[:itineraries_grid].delete(:activated)
      params[:itineraries_grid].delete(:seen)
      params[:itineraries_grid].delete(:tour_id)
    end

    @grid = ItinerariesGrid.new(itinerary_grid_params) do |scope|
      scope.where('itineraries.tour_id = ?', @tour.id)
    end
    @pagy, @records = pagy(@grid.assets)
    if request.xhr?
      respond_to do |format|
        format.turbo_stream { render "shared/index", locals: { object: Itinerary.new, objects: @itinerariess } }
      end
    else
      respond_to do |format|
        format.turbo_stream { render "shared/index", locals: { object: Itinerary.new, objects: @itinerariess } }
      end
    end
  end

  def sort
    if request.xhr?
      @itinerary = Itinerary.find(params[:itinerary_id])
      @itinerary.set_list_position(params[:itinerary][:position].to_i)
      @itinerary.save
      render body: nil
    else
      @tour = Tour.find(params[:tour_id])
      @itineraries = @tour.itineraries.order(:position)
      respond_to do |format|
        format.turbo_stream { render "shared/sort", locals: { return_path: @tour, link_object: @tour, object: Itinerary.new, objects: @itineraries } }
      end
    end
  end

  # GET /itineraries/1 or /itineraries/1.json
  def show
    @tour = @itinerary.tour
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @itinerary } }
    end
  end

  def map_locs
    respond_to do |format|
      format.json { render json: { itinerary: @itinerary.map_locs } }
    end
  end
  # GET /itineraries/new
  def new
    @itinerary = Itinerary.new
    @cities = City.all.order(:name)
    @itinerary.tour = @tour
  end

  # GET /itineraries/1/edit
  def edit
    @short = params[:short]
    @cities = City.all.order(:name)
    @tour = @itinerary.tour
  end

  # POST /itineraries or /itineraries.json
  def create
    @itinerary = Itinerary.new(itinerary_params)
    @tour = @itinerary.tour


    respond_to do |format|
      if @itinerary.save
        @grid = ItinerariesGrid.new(itinerary_grid_params) do |scope|
          scope.where('itineraries.tour_id = ?', @tour.id)
        end
        @pagy, @records = pagy(@grid.assets)
#        format.html { redirect_to itinerary_path(@itinerary), notice: 'Itinerary was successfully created.' }
        format.json { render :show, status: :created, location: @itinerary }
        format.turbo_stream { flash.now[:notice] = "Itinerary was successfully created." }
      else
        format.html do
          @cities = City.all.order(:name)
          render :new, status: :unprocessable_entity
        end
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itineraries/1 or /itineraries/1.json
  def update
    @short = params[:short]
    @tour = @itinerary.tour
    @story = @tour.story

    respond_to do |format|
      if @itinerary.update(itinerary_params)
        @grid = ItinerariesGrid.new(itinerary_grid_params) do |scope|
          scope.where('itineraries.tour_id = ?', @tour.id)
        end
        @pagy, @records = pagy(@grid.assets)
#        format.html { redirect_to itinerary_path(@itinerary), notice: 'Itinerary was successfully updated.' }
        format.json { render :show, status: :ok, location: @itinerary }
        flash.now[:notice] = "Itinerary was successfully updated."
        format.turbo_stream { render "shared/show", locals: { object: @tour } }
      else
        format.html do
          @cities = City.all.order(:name)
          render :edit, status: :unprocessable_entity
        end
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries/1 or /itineraries/1.json
  def destroy
    @tour = @itinerary.tour
    @itinerary.destroy

    @grid = ItinerariesGrid.new(itinerary_grid_params) do |scope|
      scope.where('itineraries.tour_id = ?', @tour.id)
    end
    @pagy, @records = pagy(@grid.assets)
    respond_to do |format|
#      format.html { redirect_to tour_itineraries_url(@tour), notice: 'Itinerary was successfully destroyed.' }
      format.json { head :no_content }
      format.turbo_stream { flash.now[:notice] = "Itinerary was successfully destroyed." }
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

  def itinerary_grid_params
    params.fetch(:itineraries_grid, { order: :position, descending: false }).permit!
  end

  # Only allow a list of trusted parameters through.
  def itinerary_params
    params.require(:itinerary).permit(:name, :tour_id, :city_id, :position, :stay, :summary, :intructions)
  end
end
