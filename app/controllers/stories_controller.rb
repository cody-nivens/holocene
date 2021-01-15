class StoriesController < ApplicationController
  before_action :set_story, only: [:resync_scenes, :show, :edit, :update, :destroy]
  before_action :set_book, only: [:index, :new ]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.where(book_id: @book.id).order(:position)
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  def resync_scenes
    @story.resync_key_points
    respond_to do |format|
        format.html { redirect_to book_story_path(@book, @story), notice: 'Story was successfully resynced.' }
    end
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)
    @book = @story.book

    respond_to do |format|
      if @story.save
        (params[:story][:character_ids].is_a?(Array) ? params[:story][:character_ids] : [ params[:story][:character_ids] ]).each do |character_id|
          unless character_id.blank?
            character = Character.find(character_id)
            @story.characters << character
          end
        end
        format.html { redirect_to book_story_path(@book, @story), notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new, :book_id => @book.id }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        (params[:story][:character_ids].is_a?(Array) ? params[:story][:character_ids] : [ params[:story][:character_ids] ]).each do |character_id|
          unless character_id.blank?
            character = Character.find(character_id)
            @story.characters << character
          end
        end
        format.html { redirect_to book_story_url(@book, @story), notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit, :book_id => @book.id }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to book_stories_url(:book_id => @book.id), notice: 'Story was successfully destroyed.' }
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
      params.require(:story).permit(:title, :summary, :book_id, :scene_character, :character_ids => [])
    end
end
