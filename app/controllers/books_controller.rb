class BooksController < ApplicationController
  before_action :set_book, only: [:resync_stories,:toc, :epub, :export, :pdf, :show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  def toc
    @chapters = @book.chapters.order(:position).all
  end

#      format.pdf {
#         render pdf: "export", 
#          disposition: 'attachment',
#          header: { right: '[page] of [topage]' }, 
#          outline: { outline: false,
#                     outline_depth: 1 },
#          toc: {
#            disable_dotted_lines: true,
#            disable_toc_links: true,
#            level_indentation: 3,
#            header_text: @book.name,
#            text_size_shrink: 0.5
#          }
#      }

  def resync_stories
    index = 65
    @book.stories.order(:position).each do |story|
      story.update_attribute(:scene_character, index.chr)
      index += 1
      story.resync_key_points
    end

    respond_to do |format|
        format.html { redirect_to book_stories_path(@book), notice: 'Stories were successfully resynced.' }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @chapters = @book.chapters
    @stories = @book.stories if @book.is_fiction?

    respond_to do |format|
      format.html { render :show }
      format.pdf {
         render pdf: "export", 
          disposition: 'attachment',
          header: { right: '[page] of [topage]' }, 
          outline: { outline: false,
                     outline_depth: 1 },
          toc: {
            disable_dotted_lines: true,
            disable_toc_links: true,
            level_indentation: 4,
            header_text: @book.name,
            text_size_shrink: 0.5
          }
     }
      
    end
  end

  def epub
    @notes = []
    BookEPub.new(@book).build
    tmpfile = "#{Rails.root}/tmp/example_test.epub"
    @chapters = @book.chapters
    

    respond_to do |format|
      format.html { send_file tmpfile, filename: 'file.epub', type: 'application/epub', disposition: 'inline'
                    #redirect_to @book 
                    }
    end
  end

#  def export
#    respond_to do |format|
#      format.html { send_data BookExportXML.new(@book).build, filename: 'file.tmx', type: 'application/xml', disposition: 'attachment' }
#    end
#  end

  # GET /books/new
  def new
    @book = Book.new
    @book.user_id = current_user.id
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    session[:book_id] = nil
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :body, :user_id, :show_events, :copyright, :sub_name, :publisher, :fiction)
    end
end
