class StoriesController < ApplicationController
  before_action :set_story, only: %i[stats timeline resync_scenes show edit update destroy]
  before_action :set_book, only: %i[index new]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.where(book_id: @book.id).order(:position)
  end

  def stats; end

  def sort
    @story = Story.find(params[:story_id])
    @story.update(story_params)
    render body: nil
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @object = @story
    @title = @story.name
    respond_to do |format|
      format.html { render :show }
      format.pdf do
        render pdf: 'export',
               disposition: 'attachment',
               header: { right: '[page] of [topage]' },
               outline: { outline: false,
                          outline_depth: 2 },
               toc: {
                 disable_dotted_lines: true,
                 disable_toc_links: true,
                 level_indentation: 4,
                 header_text: @story.name,
                 text_size_shrink: 0.5
               }
      end
    end
  end

  def timeline
    @toggle = params[:toggle]
    @print = params[:print]

    @object = @story
  end

  def resync_scenes
    @story.resync_key_points

    respond_to do |format|
      format.html { redirect_to story_path(@story), notice: 'Story was successfully resynced.' }
    end
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit; end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)
    @book = @story.book

    respond_to do |format|
      if @story.save
        format.html { redirect_to story_path(@story), notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new, book_id: @book.id }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to story_url(@story), notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit, book_id: @book.id }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to book_stories_url(book_id: @book.id), notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_story
    @story = Story.find(params[:id])
    @book = @story.book
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  # Only allow a list of trusted parameters through.
  def story_params
    params.require(:story).permit(:title, :summary, :book_id, :scene_character, :publish, :stand_alone,
                                  :print_summary, :position_position)
  end
end
