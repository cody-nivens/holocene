class HoloceneEventsController < ApplicationController
  before_action :set_holocene_event, only: [:show, :edit, :update, :destroy]

  def index
    @object = find_object
    @command = "Add Events"

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
          end
      end
      respond_to do |format|
        format.html {
            case @object.class.name
              when 'Chapter'
                  redirect_to book_chapter_url(:book_id => @object.book.id, :id => @object.id), notice: 'Chapter was successfully updated.'
              when 'Section'
                  redirect_to book_chapter_section_url(:book_id => @object.chapter.book.id, :chapter_id => @object.chapter.id, :id => @object.id), notice: 'Section was successfully updated.'
              when 'Timeline'
                  redirect_to timeline_url(:id => @object.id), notice: 'Timeline was successfully updated.'
              when 'Citation'
                  redirect_to biblioentry_citation_url(:biblioentry_id => @object.biblioentry_id,:id => @object.id), notice: 'Citation was successfully updated.'
              end
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

    def find_object
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def holocene_event_params
      params.require(:holocene_event).permit(:name, :start_year, :end_year, :start_year_uncert, :start_year_mod, :end_year_uncert, :end_year_mod, :event_type_id, :body, :region_id, :tag_list, :citations, :user_id, :activated, :seen, :object_id, :object_type)
    end
end
