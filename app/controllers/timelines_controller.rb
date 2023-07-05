class TimelinesController < ApplicationController
  before_action :set_timeline, only: %i[map_locs geo_map show edit update destroy]

  # GET /timelines
  # GET /timelines.json
  def index
    @timelines = Timeline.where(user_id: current_user.id).order(:name)
    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: Timeline.new, objects: @timelines } }
    end
  end

  # GET /timelines/1
  # GET /timelines/1.json
  def show
    ids = @timeline.holocene_events.pluck(:id)
    @grid = HoloceneEventsGrid.new(hgrid_params.merge({ id: ids })) do |scope|
      scope.joins(:timelines).where("timelines.id = ?", @timeline.id).includes([:event_types, :region, :rich_text_body]).page(params[:page])
    end
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @timeline, new_link_path: 'timelines', new_link_name: 'show_new_link' } }
    end
  end

  def map_locs
    respond_to do |format|
      format.json { render json: @timeline.map_locs }
    end
  end

  def geo_map
    @object = @timeline
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @timeline, no_new_link: true, part: 'map', path_name: 'shared' } }
    end
  end

  def timeline
    params.each do |name, value|
      if name =~ /(.+)_id$/
        case Regexp.last_match(1).classify
        when 'HoloceneEvent'
          @object = HoloceneEvent.includes([:rich_text_body]).find(value)
        when 'Epoch'
          @object = Epoch.find(value)
        else
          @object = Regexp.last_match(1).classify.constantize.find(value)
        end
      end
    end
    if request.xhr?
      respond_to do |format|
        format.json do
          render json: { timelines: @object.timeline_json }
        end
      end
    else
      @report = 'timeline'
      @report_path = 'timelines'
      respond_to do |format|
        format.turbo_stream { render "shared/report", locals: { report: @report, report_path: @report_path } }
      end
    end
  end

  # GET /timelines/new
  def new
    @timeline = Timeline.new
    @timeline.user_id = current_user.id
  end

  # GET /timelines/1/edit
  def edit
    @short = params[:short]
  end

  # POST /timelines
  # POST /timelines.json
  def create
    @timeline = Timeline.new(timeline_params)

    respond_to do |format|
      if @timeline.save
        @object = @timeline
        @timelines = Timeline.where(user_id: current_user.id).order(:name)
        ids = @timeline.holocene_events.pluck(:id)
        @grid = HoloceneEventsGrid.new(hgrid_params.merge({ id: ids })) do |scope|
          scope.includes([:event_types, :region, :rich_text_body]).page(params[:page])
        end
        format.html { redirect_to @timeline, notice: 'Timeline was successfully created.' }
        format.json { render :show, status: :created, location: @timeline }
        flash.now[:notice] = "Timeline was successfully created."
        #format.turbo_stream { render "shared/show", locals: { object: @timeline } }
        #format.turbo_stream { render "shared/index", locals: { object: Timeline.new, objects: @timelines } }
        format.turbo_stream { }
      else
        format.html { render :new }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timelines/1
  # PATCH/PUT /timelines/1.json
  def update
    @short = params[:short]
    @timelines = Timeline.where(user_id: current_user.id).order(:name)
    respond_to do |format|
      if @timeline.update(timeline_params)
        @object = @timeline
        ids = @timeline.holocene_events.pluck(:id)
        @grid = HoloceneEventsGrid.new(hgrid_params.merge({ id: ids })) do |scope|
          scope.includes([:event_types, :region, :rich_text_body]).page(params[:page])
        end
        format.html { redirect_to @timeline, notice: 'Timeline was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeline }
        flash.now[:notice] = "Timeline was successfully updated."
        format.turbo_stream { render "shared/show", locals: { object: @timeline } }
        #format.turbo_stream { render "shared/update", locals: { object: @timeline, short: @short } }
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
    @timelines = Timeline.where(user_id: current_user.id).order(:name)
    respond_to do |format|
      format.html { redirect_to timelines_url, notice: 'Timeline was successfully destroyed.' }
      format.json { head :no_content }
      flash.now[:notice] = "Timeline was successfully destroyed."
      format.turbo_stream { render "shared/index", locals: { object: Timeline.new, objects: @timelines } }
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
    @klass = [Book, Chapter, Story].detect { |c| params["#{c.name.underscore}_id"] }
    @object = @klass.find(params["#{@klass.name.underscore}_id"])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def timeline_params
    params.require(:timeline).permit(:name, :description, :user_id)
  end
end
