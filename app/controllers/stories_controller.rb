class StoriesController < ApplicationController
  before_action :set_story, only: %i[chars report move moved resync_scenes edit update destroy]
  before_action :set_book, only: %i[index new]

  # GET /stories
  # GET /stories.json
  def index
    @long = params[:long]
    @all = params[:all]

    @title = "Stories#{@all.nil? ? '' : ', All'}#{@long.nil? ? '' : ', Long'}"
    @stories = Story.includes([:key_points]).where(book_id: @book.id).order(:position)
    respond_to do |format|
      format.html { render :index, locals: { all: @all, long: @long } }
      format.turbo_stream { render "shared/index", locals: { object: Story.new, objects: @stories } }
    end
  end

  def report
    @report_path, @report = params[:report].split(/\//)
    @scenes_wi = Scene.get_scenes_to_array(@story)
    @scenes = @scenes_wi.collect{|x| Scene.find(x) }

    @toggle = params[:toggle]
    @print = params[:print]
    @option = params[:option]
    @long = params[:long]

    case @report
    when "stats"
      @op = "scenes"
    when "scenes"
      @situated = @story
      @op = "scenes"
      @year_options = [ ]
    when "chars"
      setup_chars
    end

    respond_to do |format|
      format.turbo_stream { render 'shared/report' }
    end
  end

  def sort
    @story = Story.find(params[:story_id])
    @story.set_list_position(params[:story][:position].to_i)
    @story.save
    render json: { message: "Success" }
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.includes({ scenes: [:section, { key_point: :scenes }, :artifact, :rich_text_place, :rich_text_summary] }).find(params[:id])
    @scripted = @story
    @book = @story.book
    @characters = @story.characters
    @title = @story.name
    @long = params[:long]
    session[:return_to] = request.fullpath

    respond_to do |format|
#      format.html { render :show }
      format.turbo_stream { render "shared/show", locals: { object: @story, new_link_path: "key_points" } }
      format.pdf do
        render pdf: 'export',
               disposition: 'attachment',
               margin: { top: 26, bottom: 26, right: 26, left: 26 },
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

  # GET /stories/1
  # GET /stories/1.json
  def view
    @story = Story.includes({ scenes: [:section, { key_point: :scenes }, :artifact, :rich_text_place, :rich_text_summary] }).find(params[:id])
    @title = "View#{params[:outline].nil? ? '' : ' Outline'}, #{@story.name}"
    @book = @story.book
    @object = @story
    @long = params[:long]
    @pdf = params[:pdf]
    @outline = params[:outline]

    @report = 'view'
    @report_path = 'stories'
    respond_to do |format|
      format.turbo_stream { render 'shared/report' }
    end
  end

  def moved
    book = @story.book
    new_book = Book.find(params[:new_book_id] )
    @story.update({ book_id: new_book.id })
    $redis.set("book_scenes_#{book.id}", nil)
    $redis.set("book_scenes_#{new_book.id}", nil)
    $redis.set("story_scenes_#{@story.id}", nil)

    @book = @story.book
    @story.key_points.each do |kp|
      kp.scenes.each do |scene|
        scene.situated = scene.key_point.scripted
        scene.book = new_book
        scene.save
      end
    end

    respond_to do |format|
      format.html { redirect_to polymorphic_url(@book), notice: 'Story successfully moved.' }
      format.json { render :show, status: :ok, location: @story}
    end
  end

  def move
    @report = 'move'
    @report_path = 'stories'
    respond_to do |format|
      format.turbo_stream { render 'shared/report' }
    end
  end

  def timeline
    @story = Story.includes([{ key_points: :scripted }]).find(params[:id])
    @book = @story.book
    @toggle = params[:toggle]
    @print = params[:print]

    @object = @story
  end

  def resync_scenes
    @story.resync_key_points(@story.book)
    $redis.set("book_scenes_#{@story.book.id}", nil)
    $redis.set("story_scenes_#{@story.id}", nil)

    respond_to do |format|
      format.html { redirect_to story_path(@story), notice: 'Story was successfully resynced.' }
    end
  end

  # GET /stories/new
  def new
    @story = Story.new
    @story.book = @book
    @long = params[:long]
  end

  # GET /stories/1/edit
  def edit
    @long = params[:long]
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)
    @book = @story.book
    @long = params[:long]

    respond_to do |format|
      if @story.save
        @scripted = @story
        @long = nil
        @link = nil
        $redis.set("book_scenes_#{@story.book.id}", nil)
        $redis.set("story_scenes_#{@story.id}", nil)
#        format.html { redirect_to story_path(@story), notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
        format.turbo_stream { flash.now[:notice] = "Story was successfully created." }
      else
        format.html { render :new, book_id: @book.id }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    old_publish = @story.publish
    @long = params[:long]

    respond_to do |format|
      if @story.update(story_params)
        @scripted = @story
        @long = nil
        @link = nil
        if old_publish != @story.publish
          $redis.set("book_scenes_#{@story.book.id}", nil)
          $redis.set("story_scenes_#{@story.id}", nil)
        end
         flash.now[:notice] = "Story was successfully updated."
#        format.html { redirect_to story_url(@story), notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
        format.turbo_stream { }
      else
        format.html { render :edit, book_id: @book.id }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    $redis.set("book_scenes_#{@story.book.id}", nil)
    $redis.set("story_scenes_#{@story.id}", nil)
    @story.destroy
    respond_to do |format|
#      format.html { redirect_to book_stories_url(book_id: @book.id), notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
        format.turbo_stream { flash.now[:notice] = "Story was successfully destroyed." }
    end
  end

  private

  def setup_chars
    @book = @story.book
    @characters = @story.characters
    @data = {}
    op = params[:op]
    op ||= false
    long = params[:long]

    @characters.each do |character|
      @data[character.name] = { count: 0, scenes: [] }
      character.scenes.each do |scene|
        next unless scene.situated.book == @book
        @data[character.name][:count] += 1
      end
    end
  end

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
    params.require(:story).permit(:title, :summary_body, :book_id, :scene_character, :publish, :stand_alone,
                                  :print_summary, :position, :title_page)
  end
end
