class ActorLocationTimesController < ApplicationController
  before_action :set_actor_location_time, only: %i[ check show edit update destroy ]
  before_action :set_location_time, only: %i[index]
  before_action :set_connector, only: %i[new]

  # GET /actor_location_times or /actor_location_times.json
  def index
    @actor_location_times = ActorLocationTime.where(location_time_id: @location_time.id)

    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: ActorLocationTime.new, objects: @actor_location_timess } }
    end
  end

  # GET /actor_location_times/1 or /actor_location_times/1.json
  def show
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @actor_location_time } }
    end
  end

  # GET /actor_location_times/new
  def new
    @actor_location_time = ActorLocationTime.new
    if @klass.name == 'Actor'
      @actor_location_time.actor = @connector
      @date_string = params[:date_string]
      @segment = LocationTime.where(date_string: @date_string)[0].segment
    else
      @actor_location_time.location_time = @connector
      @segment = @actor_location_time.location_time.segment
    end
  end

  # GET /actor_location_times/1/edit
  def edit
    @segment = @actor_location_time.location_time.segment
    @connector = @actor_location_time.location_time
  end

    # PUT /scenes/1/check
  def check
      @actor_location_time.update_attribute(:check, params[:check])
      render json: { message: "Success" }
  end


  # POST /actor_location_times or /actor_location_times.json
  def create
    @actor_location_time = ActorLocationTime.new(actor_location_time_params)
    @segment = @actor_location_time.location_time.segment
    @connector = @actor_location_time.location_time

    if params[:actor_location_time][:location_time_id].nil?
      @actor = @actor_location_time.actor_id
      loc_times = LocationTime.where(location_id: params[:location_id], date_string: params[:date_string])
      if loc_times.size == 0
        @segment = LocationTime.where(date_string: params[:date_string])[0].segment
        loc_time = LocationTime.new(location_id: params[:location_id], date_string: params[:date_string], segment_id: @segment.id)
        loc_time.save
        @actor_location_time.location_time = loc_time
      else
        @actor_location_time.location_time = loc_times[0]
      end
    end
    @location_time = @actor_location_time.location_time

    respond_to do |format|
      if @actor_location_time.save
         @actor_location_times = ActorLocationTime.where(location_time_id: @location_time.id)
#        format.html { redirect_to return_or_default_path(stage_url(@actor_location_time.location_time.segment.stage)), notice: "Actor location time was successfully created." }
        format.json { render :show, status: :created, location: @actor_location_time }
        #format.turbo_stream { render :create, status: :created } 
        format.turbo_stream { flash.now[:notice] = "Actor Location Time was successfully created." }
      else
        @klass = Location
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @actor_location_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actor_location_times/1 or /actor_location_times/1.json
  def update
    @segment = @actor_location_time.location_time.segment
    @connector = @actor_location_time.location_time
    @actor_location_times = ActorLocationTime.where(location_time_id: @location_time.id)
    respond_to do |format|
      if @actor_location_time.update(actor_location_time_params)
#        format.html { redirect_to return_or_default_path(stage_url(@actor_location_time.location_time.segment.stage)), notice: "Actor location time was successfully updated." }
        format.json { render :show, status: :ok, location: @actor_location_time }
        format.turbo_stream { flash.now[:notice] = "Actor Location Time was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @actor_location_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actor_location_times/1 or /actor_location_times/1.json
  def destroy
    @segment = @actor_location_time.location_time.segment
    @connector = @actor_location_time.location_time
    @actor_location_time.destroy
    @actor_location_times = ActorLocationTime.where(location_time_id: @location_time.id)

    respond_to do |format|
      format.html { redirect_to return_or_default_path(stage_url(@location_time.segment.stage)), notice: "Actor location time was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream { flash.now[:notice] = "Actor Location Time was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor_location_time
      @actor_location_time = ActorLocationTime.find(params[:id])
      @location_time = @actor_location_time.location_time
    end

  def set_connector
    @klass = [Actor, LocationTime].detect { |c| params["#{c.name.underscore}_id"] }
    @connector = @klass.find(params["#{@klass.name.underscore}_id"])
  end

    def set_location_time
      @location_time = LocationTime.find(params[:location_time_id])
    end

    # Only allow a list of trusted parameters through.
    def actor_location_time_params
      params.require(:actor_location_time).permit(:actor_id, :location_time_id, :role, :check)
    end
end
