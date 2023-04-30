class LocationTimesController < ApplicationController
  before_action :set_location_time, only: %i[ show edit update destroy ]
  before_action :set_segment, only: %i[index new]

  # GET /location_times or /location_times.json
  def index
    @location_times = LocationTime.where(segment_id: @segment.id)
  end

  # GET /location_times/1 or /location_times/1.json
  def show
  end

  # GET /location_times/new
  def new
    @location_time = LocationTime.new
    @location_time.segment = @segment
  end

  # GET /location_times/1/edit
  def edit
  end

  # POST /location_times or /location_times.json
  def create
    @location_time = LocationTime.new(location_time_params)
    @segment = @location_time.segment

    respond_to do |format|
      if @location_time.save
        format.html { redirect_to return_or_default_path(stage_url(@location_time.segment.stage)), notice: "Location time was successfully created." }
        format.json { render :show, status: :created, location: @location_time }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_times/1 or /location_times/1.json
  def update
    respond_to do |format|
      if @location_time.update(location_time_params)
        format.html { redirect_to return_or_default_path(stage_url(@location_time.segment.stage)), notice: "Location time was successfully updated." }
        format.json { render :show, status: :ok, location: @location_time }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @location_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_times/1 or /location_times/1.json
  def destroy
    @location_time.destroy

    respond_to do |format|
      format.html { redirect_to return_or_default_path(stage_url(@segment.stage)), notice: "Location time was successfully destroyed." }
      format.json { head :no_content }
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
