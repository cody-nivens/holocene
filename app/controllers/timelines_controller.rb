class TimelinesController < ApplicationController
  before_action :set_timeline, only: %i[geo_map show edit update destroy]
  before_action :set_object, only: [:timeline]

  # GET /timelines
  # GET /timelines.json
  def index
    @timelines = Timeline.all.order(:name)
  end

  # GET /timelines/1
  # GET /timelines/1.json
  def show
    ids = @timeline.holocene_events.pluck(:id)
    @grid = HoloceneEventsGrid.new(hgrid_params.merge({ id: ids })) do |scope|
      scope.page(params[:page])
    end
  end

  def geo_map
    @object = @timeline
  end

  def timeline; end

  # GET /timelines/new
  def new
    @timeline = Timeline.new
    @timeline.user_id = current_user.id
  end

  # GET /timelines/1/edit
  def edit; end

  # POST /timelines
  # POST /timelines.json
  def create
    @timeline = Timeline.new(timeline_params)

    respond_to do |format|
      if @timeline.save
        format.html { redirect_back_or_default(@timeline, notice: 'Timeline was successfully created.') }
        format.json { render :show, status: :created, location: @timeline }
      else
        format.html { render :new }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timelines/1
  # PATCH/PUT /timelines/1.json
  def update
    respond_to do |format|
      if @timeline.update(timeline_params)
        format.html { redirect_back_or_default(@timeline, notice: 'Timeline was successfully updated.') }
        format.json { render :show, status: :ok, location: @timeline }
      else
        format.html { render :edit }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timelines/1
  # DELETE /timelines/1.json
  def destroy
    @timeline.destroy
    respond_to do |format|
      format.html { redirect_back_or_default(timelines_url, notice: 'Timeline was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  protected

  def hgrid_params
    params.fetch(:holocene_events_grid, { order: :start_year, descending: false }).permit!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_timeline
    @timeline = Timeline.find(params[:id])
  end

  def set_object
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @object = Regexp.last_match(1).classify.constantize.find(value)
        return
      end
    end
    nil
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def timeline_params
    params.require(:timeline).permit(:name, :description, :user_id)
  end
end
