class HoloceneEventsController < ApplicationController
  before_action :set_holocene_event, only: [:show, :edit, :update, :destroy]

  def index

    respond_to do |format|
       format.html {
            @grid = HoloceneEventsGrid.new(grid_params) do |scope|
              scope.page(params[:page])
            end
       }
       format.json {
           @holocene_events = HoloceneEvent.order(:start_year).where("start_year > ?", "%#{params[:year]}%")
           render json: @holocene_events
       }
    end
  end

  def tagged
    if params[:tag].present?
      @holocene_events = HoloceneEvent.tagged_with(params[:tag])
    else
      @holocene_events = HoloceneEvent.all
    end
  end

  # GET /holocene_events/1
  # GET /holocene_events/1.json
  def show
  end

  # GET /holocene_events/new
  def new
    @holocene_event = HoloceneEvent.new
  end

  # GET /holocene_events/1/edit
  def edit
  end

  # POST /holocene_events
  # POST /holocene_events.json
  def create
    @holocene_event = HoloceneEvent.new(holocene_event_params)

    respond_to do |format|
      if @holocene_event.save
        format.html { redirect_to @holocene_event, notice: 'Holocene event was successfully created.' }
        format.json { render :show, status: :created, location: @holocene_event }
      else
        format.html { render :new }
        format.json { render json: @holocene_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holocene_events/1
  # PATCH/PUT /holocene_events/1.json
  def update
    respond_to do |format|
      if @holocene_event.update(holocene_event_params)
        format.html { redirect_to @holocene_event, notice: 'Holocene event was successfully updated.' }
        format.json { render :show, status: :ok, location: @holocene_event }
      else
        format.html { render :edit }
        format.json { render json: @holocene_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holocene_events/1
  # DELETE /holocene_events/1.json
  def destroy
    @holocene_event.destroy
    respond_to do |format|
      format.html { redirect_to holocene_events_url, notice: 'Holocene event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def grid_params
    params.fetch(:holocene_events_grid, {:order => :start_year, :descending => false}).permit!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holocene_event
      @holocene_event = HoloceneEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def holocene_event_params
      params.require(:holocene_event).permit(:name, :start_year, :end_year, :start_year_uncert, :start_year_mod, :end_year_uncert, :end_year_mod, :event_type_id, :body, :region_id, :tag_list, :citations)
    end
end
