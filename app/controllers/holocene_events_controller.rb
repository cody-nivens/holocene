class HoloceneEventsController < ApplicationController
  before_action :set_holocene_event, only: [:geo_map, :show, :edit, :update, :destroy]
  before_action :set_object, only: [:index, :display, :add_event ]

  def index
    @command = "Add Events"

    @grid = HoloceneEventsGrid.new(grid_params) do |scope|
       scope.page(params[:page])
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

  def geo_map
      @object = @holocene_event
  end


  def display
    @events = @object.holocene_events.order(:start_year)
    ids = @object.holocene_events.pluck(:id)
    if ids.length == 0
        @command = "Add Events"
    else
        @command = "Delete Events"
    end
    @list_items = (@object.class.name == 'Chapter' ? @object.sections.order(:name) : (@object.class.name == 'Section' ? @object.chapter.sections.order(:name) : nil))
    @grid = HoloceneEventsGrid.new(grid_params.merge({:id => ids,:object => @object})) do |scope|
        scope.page(params[:page])
    end
  end

  def add_event
    @events = @object.holocene_events.order(:start_year)
    event_ids = add_background_events(@object)
    ids = event_ids - @object.holocene_events.ids
    @command = "Add Events"
    @grid = HoloceneEventsGrid.new(grid_params.merge({:id => ids,:object => @object})) do |scope|
        scope.page(params[:page])
    end
    respond_to do |format|
        format.html { render :display }
    end 
  end

  # GET /holocene_events/new
  def new
    @holocene_event = HoloceneEvent.new
    @holocene_event.user_id = current_user.id
  end

  # GET /holocene_events/1/edit
  def edit
  end

  def objects
      @object = params[:holocene_event][:object_type].classify.constantize.find(params[:holocene_event][:object_id])

      params[:holocene_event][:activated].each do |he_id|
          case params[:commit]
          when "Add Events"
            he = HoloceneEvent.find(he_id)
            @object.holocene_events << he
          when "Delete Events"
            he = HoloceneEvent.find(he_id)
            @object.holocene_events.delete(he)
            case object_type = params[:holocene_event][:object_type]
            when "Section"
                @other = @object.chapter
                @other.holocene_events << he
            end
          when "Move Events"
            he = HoloceneEvent.find(he_id)
            @object.holocene_events.delete(he)
            if params[:holocene_event][:other_id] != ""
                case object_type = params[:holocene_event][:object_type]
                when "Section"
                    @other = @object.chapter.sections.find(params[:holocene_event][:other_id])
                    @other.holocene_events << he
                when "Chapter"
                    @other = @object.sections.find(params[:holocene_event][:other_id])
                    @other.holocene_events << he
                end
            end
          end
      end
      respond_to do |format|
        format.html {
            redirect_to "/#{@object.class.name.underscore.pluralize}/show/#{@object.id}",
                                :notice => "#{@object.class.name} was successfully updated"
        }
        format.json { render :show, status: :created, location: @holocene_event }
      end
  end

  # POST /holocene_events
  # POST /holocene_events.json
  def create
    params.delete(:activated)
    params.delete(:seen)
    params.delete(:object_id)
    params.delete(:object_type)
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
    params[:holocene_event].delete(:activated)
    params[:holocene_event].delete(:seen)
    params[:holocene_event].delete(:object_id)
    params[:holocene_event].delete(:object_type)
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

    def set_object
      params.each do |name, value|
        if name =~ /(.+)_id$/
          @object = $1.classify.constantize.find(value)
          return
        end
      end
      nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def holocene_event_params
      params.require(:holocene_event).permit(:name, :start_year, :end_year, :start_year_uncert, :start_year_mod, :end_year_uncert, :end_year_mod, :body, :region_id, :tag_list, :citations, :user_id, :activated, :seen, :object_id, :object_type, :image, event_type_ids: [])
    end
end
