class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:geo_map, :pdf, :holocene_events, :sections, :show, :edit, :update, :destroy]
  before_action :set_book, only: [ :index, :create, :new, :edit, :update, :destroy]

  def index
       @chapters = @book.chapters.order(:position).all
  end

  def geo_map
      @object = @chapter
  end


  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @sections = @chapter.sections.order(:position)
    respond_to do |format|
      format.html { render :show }
      format.pdf {
        render pdf: "chapter_#{@chapter.id}", 
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
      @book = @chapter.book
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
      params.require(:chapter).permit(:name, :body, :position, :book_id, :position, :aside)
    end
end
