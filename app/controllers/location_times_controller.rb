class LocationTimesController < ApplicationController
  before_action :set_location_time, only: %i[ show edit update destroy ]
  before_action :set_segment, only: %i[index new]

  # GET /location_times or /location_times.json
  def index
    @location_times = LocationTime.where(segment_id: @segment.id)
    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: LocationTime.new, objects: @location_times } }
    end
  end

  # GET /location_times/1 or /location_times/1.json
  def show
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @location_time } }
    end
  end

  # GET /location_times/new
  def new
    @location_time = LocationTime.new
    @location_time.segment = @segment
  end

  # GET /location_times/1/edit
  def edit
    @short = params[:short]
  end

  # POST /location_times or /location_times.json
  def create
    @location_time = LocationTime.new(location_time_params)
    @segment = @location_time.segment
    @stage = @segment.stage
    @act = @stage.act
    @op = params[:op] || "locations"

    respond_to do |format|
      if @location_time.save
        @location_times = LocationTime.where(segment_id: @segment.id)
        #        format.html { redirect_to return_or_default_path(stage_url(@location_time.segment.stage)), notice: "Location time was successfully created." }
        format.json { render :show, status: :created, location: @location_time }
        flash.now[:notice] = "Location Time was successfully created."
        format.turbo_stream { render "shared/show", locals: { object: @stage } }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_times/1 or /location_times/1.json
  def update
    @short = params[:short]
    @location_times = LocationTime.where(segment_id: @segment.id)
    respond_to do |format|
      if @location_time.update(location_time_params)
        @stage = @segment.stage
        @act = @stage.act
        @op = params[:op] || "locations"

        #        format.html { redirect_to return_or_default_path(stage_url(@location_time.segment.stage)), notice: "Location time was successfully updated." }
        format.json { render :show, status: :ok, location: @location_time }
        flash.now[:notice] = "Location Time was successfully updated."
        #render "shared/show", locals: { object: @stage }
        format.turbo_stream { render "shared/update", locals: { object: @location_time, short: @short } }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @location_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_times/1 or /location_times/1.json
  def destroy
    segment = @location_time.segment
    @stage = @segment.stage
    @act = @stage.act
    @op = params[:op] || "locations"
    @location_time.destroy

    @location_times = LocationTime.where(segment_id: @segment.id)
    respond_to do |format|
      #      format.html { redirect_to return_or_default_path(stage_url(@segment.stage)), notice: "Location time was successfully destroyed." }
      format.json { head :no_content }
      flash.now[:notice] = "Location Time was successfully destroyed."
      format.turbo_stream { render "shared/show", locals: { object: @stage } }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_location_time
    @location_time = LocationTime.find(params[:id])
    @segment = @location_time.segment
  end

  def set_segment
    @segment = Segment.find(params[:segment_id])
  end

  # Only allow a list of trusted parameters through.
  def location_time_params
    params.require(:location_time).permit(:location_id, :date_string, :segment_id)
  end
end
