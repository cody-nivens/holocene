class RegionsController < ApplicationController
  before_action :set_region, only: %i[show edit update destroy]

  # GET /regions
  # GET /regions.json
  def index
    @regions = Region.all
    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: Region.new, objects: @regions } }
    end
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
    @grid = HoloceneEventsGrid.new(hgrid_params) do |scope|
      scope.where(region_id: @region.id).page(params[:page])
    end
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @region, no_new_link: true } }
    end
  end

  # GET /regions/new
  def new
    @region = Region.new
    @region.user_id = current_user.id
  end

  # GET /regions/1/edit
  def edit
    @short = params[:short]
  end

  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(region_params)

    respond_to do |format|
      if @region.save
        @regions = Region.all
#        format.html { redirect_to @region, notice: 'Region was successfully created.' }
        format.json { render :show, status: :created, location: @region }
        flash.now[:notice] = "Region was successfully created."
        format.turbo_stream { render "shared/index", locals: { object: Region.new, objects: @regions } }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1
  # PATCH/PUT /regions/1.json
  def update
    @short = params[:short]
    @regions = Region.all
    respond_to do |format|
      if @region.update(region_params)
         @grid = HoloceneEventsGrid.new(hgrid_params) do |scope|
           scope.where(region_id: @region.id).page(params[:page])
         end
#        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
        flash.now[:notice] = "Region was successfully updated."
        #format.turbo_stream { render "shared/show", locals: { object: @region } }
        format.turbo_stream { render "shared/update", locals: { object: @region, short: @short } }
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
