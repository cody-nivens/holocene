class LocationsController < ApplicationController
  before_action :set_location, only: %i[ show edit update destroy ]
  before_action :set_book, only: %i[index new]


  # GET /locations or /locations.json
  def index
    @locations = Location.where(book_id: @book.id).order(:name)
    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: Location.new, objects: @locations } }
    end
  end

  # GET /locations/1 or /locations/1.json
  def show
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @location } }
    end
  end

  # GET /locations/new
  def new
    @location = Location.new
    @location.book = @book
  end

  # GET /locations/1/edit
  def edit
    @short = params[:short]
  end

  # POST /locations or /locations.json
  def create
    @location = Location.new(location_params)
    @book = @location.book

    respond_to do |format|
      if @location.save
        @locations = Location.where(book_id: @book.id).order(:name)
        format.html { redirect_to location_url(@location), notice: "Location was successfully created." }
        format.json { render :show, status: :created, location: @location }
        flash.now[:notice] = "Location was successfully created."
        format.turbo_stream { render "shared/index", locals: { object: Location.new, objects: @locations } }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1 or /locations/1.json
  def update
    @short = params[:short]
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to location_url(@location), notice: "Location was successfully updated." }
        format.json { render :show, status: :ok, location: @location }
        flash.now[:notice] = "Location was successfully updated."
        #format.turbo_stream { render "shared/show", locals: { object: @location } }
        format.turbo_stream { render "shared/update", locals: { object: @location, short: @short } }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1 or /locations/1.json
  def destroy
    @location.destroy

    respond_to do |format|
      format.html { redirect_to book_locations_url(@book), notice: "Location was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream { flash.now[:notice] = "Location was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
      @book = @location.book
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:name, :book_id, :desc)
    end
end
