class HoloceneEventsController < ApplicationController
  before_action :set_holocene_event, only: %i[geo_map show edit update destroy]
  before_action :set_object, only: %i[index display add_event]

  def index
    @command = 'Add Events'
    @long = params[:long]

    @grid = HoloceneEventsGrid.new(grid_params) do |scope|
      scope.includes([:event_types, :region, :rich_text_body]).page(params[:page])
    end
    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: HoloceneEvent.new, objects: @holocene_events } }
    end
  end

  def tagged
    @holocene_events = if params[:tag].present?
                         HoloceneEvent.tagged_with(params[:tag])
                       else
                         HoloceneEvent.all
                       end
    respond_to do |format|
      format.turbo_stream { }
    end
  end

  # GET /holocene_events/1
  # GET /holocene_events/1.json
  def show
    @long = params[:long]
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @holocene_event } }
    end
  end

  def geo_map
    @object = @holocene_event
    respond_to do |format|
      format.turbo_stream { }
    end
  end

  def display
    @events = @object.holocene_events.includes([:event_types]).order(:start_year)
    ids = @object.holocene_events.pluck(:id)
    @command = if ids.size == 0 || params[:commit] == 'Search'
                 'Add Events'
               else
                 'Delete Events'
               end
    @list_items = (if @object.instance_of?(Chapter)
                     @object.sections.order(:name)
                   else
                     (@object.instance_of?(Section) ? @object.sectioned.sections.order(:name) : nil)
                   end)
    @grid = HoloceneEventsGrid.new(grid_params.merge({ object: @object, command: @command })) do |scope|
      if @command == 'Add Events'
        scope.includes([:event_types, :region, :rich_text_body]).page(params[:page])
      else
        scope.where(id: ids).includes([:event_types, :region, :rich_text_body]).page(params[:page])
      end
    end
    respond_to do |format|
      format.turbo_stream { }
    end
  end

  def add_event
    @events = @object.holocene_events.order(:start_year)
    event_ids = add_background_events(@object)
    ids = event_ids - @object.holocene_events.ids
    @command = 'Add Events'
    @grid = HoloceneEventsGrid.new(grid_params.merge({ id: ids, object: @object, command: @command })) do |scope|
      scope.includes([:event_types, :region, :rich_text_body]).page(params[:page])
    end
    respond_to do |format|
      format.html { render :display }
      format.turbo_stream { render :display }
    end
  end

  # GET /holocene_events/new
  def new
    @holocene_event = HoloceneEvent.new
    @holocene_event.user_id = current_user.id
    @related_events = HoloceneEvent.where(user_id: current_user.id).all.order(:start_year)
  end

  # GET /holocene_events/1/edit
  def edit
    @related_events = HoloceneEvent.where(user_id: current_user.id).all.order(:start_year)
  end

  def objects
    @object = params[:holocene_event][:object_type].classify.constantize.find(params[:holocene_event][:object_id])

    params[:holocene_event][:activated].each do |he_id|
      case params[:commit]
      when 'Add Events'
        he = HoloceneEvent.find(he_id)
        @object.holocene_events << he
      when 'Delete Events'
        he = HoloceneEvent.find(he_id)
        @object.holocene_events.delete(he)
        case object_type = params[:holocene_event][:object_type]
        when 'Section'
          @object = @object.sectioned
          @object.holocene_events << he
        end
      when 'Move Events'
        he = HoloceneEvent.find(he_id)
        @object.holocene_events.delete(he)
        if params[:holocene_event][:other_id] != ''
          case object_type = params[:holocene_event][:object_type]
          when 'Section'
            @object = @object.sectioned.sections.find(params[:holocene_event][:other_id])
            @object.holocene_events << he
          when 'Chapter'
            @object = @object.sections.find(params[:holocene_event][:other_id])
            @object.holocene_events << he
          end
        end
      end
    end
    instance_variable_set("@#{@object.class.name.underscore}", @object)
    ids = @object.holocene_events.pluck(:id)
    @grid = HoloceneEventsGrid.new(grid_params.merge({ id: ids, object: @object, command: @command })) do |scope|
      scope.includes([:event_types, :region, :rich_text_body]).page(params[:page])
    end
    respond_to do |format|
      format.html do
        redirect_to "/#{@object.class.name.underscore.pluralize}/show/#{@object.id}",
                    notice: "#{@object.class.name} was successfully updated"
      end
      format.json { render :show, status: :created, location: @holocene_event }
      flash.now[:notice] = "#{@object.class.name} was successfully updated"
      format.turbo_stream { render "shared/show", locals: { object: @object, part: 'display' } }
    end
  end

  # POST /holocene_events
  # POST /holocene_events.json
  def create
    params.delete(:activated)
    params.delete(:seen)
    params.delete(:object_id)
    params.delete(:object_type)
    @related_events = HoloceneEvent.where(user_id: current_user.id).all.order(:start_year)
    @holocene_event = HoloceneEvent.new(holocene_event_params)

    respond_to do |format|
      if @holocene_event.save
        @command = 'Add Events'
        @grid = HoloceneEventsGrid.new(grid_params) do |scope|
          scope.includes([:event_types, :region, :rich_text_body]).page(params[:page])
        end
        format.html { redirect_to @holocene_event, notice: 'Holocene Event was successfully created.' }
        format.json { render :show, status: :created, location: @holocene_event }
        flash.now[:notice] = "Holocene Event was successfully created."
        format.turbo_stream { render "shared/index", locals: { object: HoloceneEvent.new, objects: @holocene_events } }
      else
        format.html { render :new }
        format.json { render json: @holocene_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holocene_events/1
  # PATCH/PUT /holocene_events/1.json
  def update
    params[:holocene_event].delete(:activated)
    params[:holocene_event].delete(:seen)
    params[:holocene_event].delete(:object_id)
    params[:holocene_event].delete(:object_type)
    @related_events = HoloceneEvent.where(user_id: current_user.id).all.order(:start_year)
    @holocene_event.related_endpoint = params[:related_endpoint] == 'Start' ? false : true
    respond_to do |format|
      if @holocene_event.update(holocene_event_params)
        @command = 'Add Events'

        @grid = HoloceneEventsGrid.new(grid_params) do |scope|
          scope.includes([:event_types, :region, :rich_text_body]).page(params[:page])
        end
        format.html { redirect_to @holocene_event, notice: 'Holocene Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @holocene_event }
        flash.now[:notice] = "Holocene Event was successfully updated."
        format.turbo_stream { render "shared/index", locals: { object: HoloceneEvent.new, objects: @holocene_events } }
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
    @command = 'Add Events'
    @grid = HoloceneEventsGrid.new(grid_params) do |scope|
      scope.includes([:event_types, :region, :rich_text_body]).page(params[:page])
    end
    respond_to do |format|
      format.html { redirect_to holocene_events_url, notice: 'Holocene Event was successfully destroyed.' }
      format.json { head :no_content }
      flash.now[:notice] = "Holocene Event was successfully destroyed."
      format.turbo_stream { render "shared/index", locals: { object: HoloceneEvent.new, objects: @holocene_events } }
    end
  end

  protected

  def grid_params
    params.fetch(:holocene_events_grid, { order: :start_year, descending: false }).permit!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_holocene_event
    @holocene_event = HoloceneEvent.find(params[:id])
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
  def holocene_event_params
    params.require(:holocene_event).permit(:name, :start_year, :end_year, :start_year_uncert, :start_year_mod,
                                           :end_year_uncert, :end_year_mod, :body, :region_id, :tag_list, :citations,
                                           :user_id, :activated, :seen, :object_id, :object_type, :url, :image,
                                           :related_id, :related_endpoint, :start_related_offset, :end_related_offset, event_type_ids: [])
  end
end
