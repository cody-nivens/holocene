class ActorLocationTimesController < ApplicationController
  before_action :set_actor_location_time, only: %i[ show edit update destroy ]
  before_action :set_location_time, only: %i[index new]

  # GET /actor_location_times or /actor_location_times.json
  def index
    @actor_location_times = ActorLocationTime.where(location_time_id: @location_time.id)
  end

  # GET /actor_location_times/1 or /actor_location_times/1.json
  def show
  end

  # GET /actor_location_times/new
  def new
    @actor_location_time = ActorLocationTime.new
    @actor_location_time.location_time = @location_time
  end

  # GET /actor_location_times/1/edit
  def edit
  end

  # POST /actor_location_times or /actor_location_times.json
  def create
    @actor_location_time = ActorLocationTime.new(actor_location_time_params)
    @location_time = @actor_location_time.location_time

    respond_to do |format|
      if @actor_location_time.save
        format.html { redirect_to return_or_default_path(stage_url(@actor_location_time.location_time.segment.stage)), notice: "Actor location time was successfully created." }
        format.json { render :show, status: :created, location: @actor_location_time }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @actor_location_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actor_location_times/1 or /actor_location_times/1.json
  def update
    respond_to do |format|
      if @actor_location_time.update(actor_location_time_params)
        format.html { redirect_to return_or_default_path(stage_url(@actor_location_time.location_time.segment.stage)), notice: "Actor location time was successfully updated." }
        format.json { render :show, status: :ok, location: @actor_location_time }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @actor_location_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actor_location_times/1 or /actor_location_times/1.json
  def destroy
    @actor_location_time.destroy

    respond_to do |format|
      format.html { redirect_to return_or_default_path(stage_url(@location_time.segment.stage)), notice: "Actor location time was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor_location_time
      @actor_location_time = ActorLocationTime.find(params[:id])
      @location_time = @actor_location_time.location_time
    end

    def set_location_time
      @location_time = LocationTime.find(params[:location_time_id])
    end

    # Only allow a list of trusted parameters through.
    def actor_location_time_params
      params.require(:actor_location_time).permit(:actor_id, :location_time_id, :role)
    end
end
