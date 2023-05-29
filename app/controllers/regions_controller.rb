class RegionsController < ApplicationController
  before_action :set_region, only: %i[show edit update destroy]

  # GET /regions
  # GET /regions.json
  def index
    @regions = Region.all
    respond_to do |format|
      format.turbo_stream { } 
    end
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
    @grid = HoloceneEventsGrid.new(hgrid_params) do |scope|
      scope.where(region_id: @region.id).page(params[:page])
    end
    respond_to do |format|
      format.turbo_stream { } 
    end
  end

  # GET /regions/new
  def new
    @region = Region.new
    @region.user_id = current_user.id
  end

  # GET /regions/1/edit
  def edit; end

  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(region_params)
    @regions = Region.all

    respond_to do |format|
      if @region.save
#        format.html { redirect_to @region, notice: 'Region was successfully created.' }
        format.json { render :show, status: :created, location: @region }
        format.turbo_stream { flash.now[:notice] = "Region was successfully created." }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1
  # PATCH/PUT /regions/1.json
  def update
    @regions = Region.all
    respond_to do |format|
      if @region.update(region_params)
#        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
        format.turbo_stream { flash.now[:notice] = "Region was successfully updated." }
      else
        format.html { render :edit }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy
    @region.destroy
    @regions = Region.all
    respond_to do |format|
#      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.json { head :no_content }
      format.turbo_stream { flash.now[:notice] = "Region was successfully destroyed." }
    end
  end

  protected

  def hgrid_params
    params.fetch(:holocene_events_grid, { order: :start_year, descending: false }).permit!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_region
    @region = Region.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def region_params
    params.require(:region).permit(:name, :body, :user_id)
  end
end
