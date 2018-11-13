class CitationsController < ApplicationController
  before_action :set_citation, only: [:timeline, :display, :show, :edit, :update, :destroy]
  before_action :set_biblioentry, only: [:index, :new, :show, :edit, :create, :update, :destroy]

  # GET /citations
  # GET /citations.json
  def index
      @citations = @biblioentry.citations 
  end

  # GET /citations/1
  # GET /citations/1.json
  def show
      ids = @citation.holocene_events.pluck(:id) 
      @grid = HoloceneEventsGrid.new(hgrid_params.merge({:id => ids})) do |scope|
        scope.page(params[:page])
    end
  end

  def display
    @events = @citation.holocene_events.order(:start_year)
    ids = @citation.holocene_events.pluck(:id)
    @object = @citation
    if ids.length == 0
      @command = "Add Events"
    else
      @command = "Delete Events"
    end

    @grid = HoloceneEventsGrid.new(hgrid_params.merge({:id => ids,:object => @object})) do |scope|
        scope.page(params[:page])
    end
  end

  def timeline
  end

  # GET /citations/new
  def new
    @citation = Citation.new
    @citation.user_id = current_user.id
    @citation.biblioentry_id = @biblioentry.id
  end

  # GET /citations/1/edit
  def edit
  end

  # POST /citations
  # POST /citations.json
  def create
    @citation = Citation.new(citation_params)

    respond_to do |format|
      if @citation.save
          format.html { redirect_to biblioentry_citation_url(@citation.biblioentry,@citation), notice: 'Citation was successfully created.' }
        format.json { render :show, status: :created, location: @citation }
      else
        format.html { render :new }
        format.json { render json: @citation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citations/1
  # PATCH/PUT /citations/1.json
  def update
    respond_to do |format|
      if @citation.update(citation_params)
        format.html { redirect_to biblioentry_citation_url(@citation.biblioentry,@citation), notice: 'Citation was successfully updated.' }
        format.json { render :show, status: :ok, location: @citation }
      else
        format.html { render :edit }
        format.json { render json: @citation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citations/1
  # DELETE /citations/1.json
  def destroy
    @citation.destroy
    respond_to do |format|
      format.html { redirect_to biblioentry_citations_url(@biblioentry), notice: 'Citation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def hgrid_params
    params.fetch(:holocene_events_grid, {:order => :start_year, :descending => false}).permit!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citation
      @citation = Citation.find(params[:id])
    end

    def set_biblioentry
      @biblioentry = Biblioentry.find(params[:biblioentry_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def citation_params
      params.require(:citation).permit(:name, :body, :user_id, :biblioentry_id)
    end
end
