class BooksController < ApplicationController
  before_action :set_book,
                only: %i[publish view show chars stats timeline resync_stories toc epub export pdf edit update destroy]

  # GET /books
  # GET /books.json
  def index
    @long = params[:long]
    @books = Book.where(user_id: current_user.id).order(:position)
  end

  def stats; end

  def publish
    @stories = @book.stories.order(:position)
    @stories.each do |story|
      story.update_attribute(:publish, true)
    end

    respond_to do |format|
      format.html { render :show, locals: { long: false } }
    end
  end

  def chars
    @characters = @book.characters
    @data = {}
    op = params[:op]

    @characters.each do |character|
      @data[character.name] = { count: 0, scenes: [] }
      character.scenes.each do |scene|
        next unless scene.situated.book == @book
        @data[character.name][:count] += 1
      end
    end

    respond_to do |format|
      format.html { render :chars, locals: { book: @book, op: op } }
    end

  end

  def sort
    @book = Book.find(params[:book_id])
    @book.update(book_params)
    render body: nil
  end

  def timeline
    @toggle = params[:toggle]
    @print = params[:print]

    @object = @book
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
    @book.resync_stories
    $redis.set("book_scenes_#{@book.id}", nil)

    @book.stories.includes([:character_stories, :characters]).each do |story|
      $redis.set("story_scenes_#{story.id}", nil)
      story.characters.each do |character|
        @book.characters << character unless @book.characters.include?(character)
      end
    end

    #Scene.includes([:situated]).order(:abc).each_with_index do |x, i|
    #  x.update({ position: i })
    #end

    respond_to do |format|
      format.html { redirect_to book_stories_path(@book), notice: 'Stories were successfully resynced.' }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    long = params[:long]

    if @book.is_fiction?
      if long
        @stories = @book.stories.where(publish: true).includes(:rich_text_summary_body).order(:position)
      else
        @stories = @book.stories.where(publish: true).order(:position)
      end
      @scenes = Scene.get_scenes_wi_to_array(@book)
    else
      @chapters = @book.chapters.includes({ holocene_events: :rich_text_body })
    end

    respond_to do |format|
      format.html { render :show, locals: { long: long } }
      format.pdf do
        render pdf: 'export',
               disposition: 'attachment',
               header: { right: '[page] of [topage]' },
               margin: { top: 26, bottom: 26, right: 26, left: 26 },
               outline: { outline: false,
                          outline_depth: 2 },
               toc: {
                 disable_dotted_lines: true,
                 disable_toc_links: true,
                 level_indentation: 2,
                 header_text: @book.name,
                 text_size_shrink: 0.5
               }
      end
    end
  end

  # GET /books/1
  # GET /books/1.json
  def view
    if @book.is_fiction?
      @scripted = @book
      @stories = @book.stories.where(publish: true).order(:position) if @book.is_fiction?
      @scenes = Scene.get_scenes_wi_to_array(@book)
    else
      @chapters = @book.chapters.includes({ holocene_events: :rich_text_body })
    end
    long = params[:long]
    outline = params[:outline]

    respond_to do |format|
      format.html { render :view, locals: { outline: outline, long: long } }
    end
  end

  def epub
    @notes = []
    BookEPub.new(@book).build
    tmpfile = "#{Rails.root}/tmp/example_test.epub"
    @chapters = @book.chapters

    respond_to do |format|
      format.html do
        send_file tmpfile, filename: 'file.epub', type: 'application/epub', disposition: 'inline'
        # redirect_to @book
      end
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
  def edit; end

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
    session[:book_id] = @book.id
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:name, :body, :summary, :user_id, :show_events, :copyright, :sub_name, :publisher, :fiction,
                                 :position_position)
  end
end
