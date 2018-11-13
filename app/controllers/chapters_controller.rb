class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:pdf, :holocene_events, :sections, :display, :timeline, :show, :edit, :update, :destroy]
  before_action :set_book, only: [ :index, :create, :show, :new, :edit, :update, :destroy]

  def index
       @chapters = @book.chapters.order(:position).all
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @sections = @chapter.sections.order(:position)
    respond_to do |format|
      format.html { render :show }
      format.pdf do
       render pdf: "export.pdf", locals: {chapter: @chapter}
      end
    end
  end

  def display
    @events = @chapter.holocene_events.order(:start_year)
    @book = @chapter.book
    ids = @chapter.holocene_events.pluck(:id)
    @object = @chapter
    if ids.length == 0
      @command = "Add Events"
    else
      @command = "Delete Events"
    end

    @grid = HoloceneEventsGrid.new(hgrid_params.merge({:id => ids,:object => @object})) do |scope|
        scope.page(params[:page])
    end
  end

  def pdf
          #disposition: 'inline',

    respond_to do |format|
      format.pdf {
         render pdf: "export.pdf", 
          disposition: 'attachment',
          header: { right: '[page] of [topage]' }, 
          toc: {
            disable_dotted_lines: true,
            disable_toc_links: true,
            level_indentation: 3,
            header_text: 'Climate and History',
            text_size_shrink: 0.5
          }
      }
    end
  end

  def timeline
#    @events = @chapter.holocene_events.order(:start_year)
#    my_ids = []
#    unless @events.length == 0
#      start_year = @events.first.start_year
#      end_year = (@events[@events.length - 1].end_year.nil? ?  @events[@events.length - 1].start_year : @events[@events.length - 1].end_year)
#
#      timeline = Timeline.find_by_name("Main")
#      t_events = timeline.holocene_events
#
#      my_events = t_events.where("start_year >= ?",start_year).where("start_year <= ?",end_year)
#      my_ids = my_events.pluck(:id)
#    end
#    ids = @chapter.holocene_events.pluck(:id)
#    the_ids = ids + my_ids
#    @grid = HoloceneEventsGrid.new(hgrid_params.merge({:id => the_ids})) do |scope|
#        scope.page(params[:page])
#    end
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
    @chapter.book_id = @book.id
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to book_chapter_path(@book,@chapter), notice: 'Chapter was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to book_chapter_path(@book, @chapter), notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to book_chapters_url(@book), notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def hgrid_params
    params.fetch(:holocene_events_grid, {:order => :start_year, :descending => false}).permit!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:name, :body, :position, :book_id, :position)
    end
end
