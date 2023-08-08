class ScenesController < ApplicationController
  before_action :set_scene, only: %i[check moved move show edit update destroy]
  before_action :set_situated, only: %i[timeline new]

  # GET /scenes
  # GET /scenes.json
  def index
    case params[:scene][:situated_type]
    when 'Book'
      @situated = Book.find(params[:scene][:situated_id])
      @book = @situated
    when 'Story'
      @situated = Story.find(params[:scene][:situated_id])
      @story = @situated
    end

    @toggle = params[:toggle]
    @print = params[:print]
    @option = params[:option]
    @long = params[:long]
    @button_action = params[:button_action]

    if @button_action == "Reset Checked"
      scenes = Scene.get_scenes_to_array(@situated)
      scenes.each do |scene|
        my_scene = Scene.find(scene)
        my_scene.update_attribute(:check, false)
      end
    end

    unless params[:low_wc].blank?
      current_user.user_datum.wc_low = @low_wc = params[:low_wc]
    end
    unless params[:mid_wc].blank?
      current_user.user_datum.wc_mid = @mid_wc = params[:mid_wc]
    end
    unless params[:better_wc].blank?
      current_user.user_datum.wc_better = @better_wc = params[:better_wc]
    end
    current_user.user_datum.save if current_user.user_datum.changed?

    @year = params[:year]
    @years = []
    @scenes_wi = Scene.get_scenes_wi_to_array(@situated)
    @scenes = @scenes_wi.collect{|x| Scene.find(x) }
    unless @scenes.nil?
    if 1 == 0
      @years =  @scenes.sort
      if @year.nil?
        @scenes = @scenes
        @year = @years[0] if @year.nil?
      end

    end
    @year_options = []
      @years.each do |year|
        @year_options << [year, year]
      end
    end

    @report = "scenes"
    @report_path = @situated.class.name.underscore.pluralize
    respond_to do |format|
      format.html {}
      format.js {}
      format.turbo_stream { render "shared/report", locals: { report: @report, report_path: @report_path } }
    end
  end

  # PUT /scenes/1/check
  def check
      @scene.update_attribute(:check, params[:check])
    render json: { message: "Success" }
  end

  def sort
    # @list = List.find(params[:list_id])
    @scene = Scene.find(params[:scene_id])
    @scene.update(scene_params)
    render json: { message: "Success" }
  end

  # GET /scenes/1
  # GET /scenes/1.json
  def show
    @title = @scene.name
    @situated = @scene.book
    @book = @scene.book
    @object = @book
    @story = @scene.key_point.scripted
    @scripted = @story
    @key_point = @scene.key_point
    @option = params[:option]
    @long = params[:option]

    @scenes_wi = Scene.get_scenes_wi_to_array(@situated)
    @scenes = @scenes_wi.collect{|x| Scene.find(x) }
    #session[:return_to] = request.fullpath
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @scene, no_new_link: true } }
    end
  end

  def move
    @situated = @scene.situated
    @key_point = @scene.key_point
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @scene, part: "move", no_new_link: true } }
    end
  end

  def moved
    @situated = @scene.situated
    @key_point = @scene.key_point
    @scene.book = @key_point.scripted.book
    @selector = params[:selector]
    @new_selector = params[:new_selector]
     
    
    new_story = Story.find(params[:story_id])

    @new_key_point = KeyPoint.find(params[:new_key_point_id])
    @scene.key_point = @new_key_point
    @scene.situated = new_story
    @scene.selector = @new_selector
    @scene.book = new_story.book


    respond_to do |format|
      if @scene.save
        @scenes_wi = Scene.get_scenes_wi_to_array(@situated, nil, force: true)
        title = @key_point.selector_value(@selector)
        @scene.key_point.selector_value_set(@new_selector, title)
        @scene.key_point.save
        format.html { redirect_to polymorphic_path(@scene), notice: 'Scene was successfully moved.' }
      else
        format.html do
          render :move, situated_tyep: @situated.class.name, situated_id: @situated.id, new_key_point_id: @key_point.id
        end
      end
    end
  end

  # GET /scenes/new
  def new
    @scene = Scene.new
    @scene.situated = @situated

    @kp_klass = [KeyPoint].detect { |c| params["#{c.name.underscore}_id"] }
    @key_point = (params[:key_point_id].nil? ? nil : @kp_klass.find(params[:key_point_id]))

    @selector = params[:selector]
    @scene.selector = @selector
    @scene.key_point = @key_point
    @scene.date_string = '0001-01-01-07-00'
  end

  # GET /scenes/1/edit
  def edit
    @short = params[:short]
    @situated = @scene.situated
    @kp_klass = [KeyPoint].detect { |c| params["#{c.name.underscore}_id"] }
    @key_point = (params[:key_point_id].nil? ? nil : @kp_klass.find(params[:key_point_id]))
    @selector = params[:selector]
  end

  # POST /scenes
  # POST /scenes.json
  def create
    @scene = Scene.new(scene_params)
    @key_point = @scene.key_point
    @situated = @scene.situated
    @scripted = @key_point.scripted
    @selector = params[:selector]
    @scene.selector = @selector
    @option = 'scenes'
    @long = false

    @scene.book = @key_point.scripted.book
    @scene.date_string = '%04d' % params['t']['year'].to_i + '-%02d' % params['t']['month'].to_i + '-%02d' % params['t']['day'].to_i + '-%02d' % params['t']['hour'].to_i + '-%02d' % params['t']['minute'].to_i

    @option = params[:option]
    @long = params[:option]

    respond_to do |format|
      if @scene.save
        @scenes_wi = Scene.get_scenes_wi_to_array(@situated, nil, force: true)
        @scenes = @scenes_wi.collect{|x| Scene.find(x) }
#        format.html { redirect_to scene_path(@scene), notice: 'Scene was successfully created.' }
        format.json { render :show, status: :created, location: @scene }
        flash.now[:notice] = "Scene was successfully created."
        format.turbo_stream { render "shared/show", locals: { object: @scene, no_new_link: true } }
      else
        format.html { render :new, situated_type: @situated.class.name, situated_id: @situated.id }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scenes/1
  # PATCH/PUT /scenes/1.json
  def update
    @short = params[:short]
    @scene.date_string = '%04d' % params['t']['year'].to_i + '-%02d' % params['t']['month'].to_i + '-%02d' % params['t']['day'].to_i + '-%02d' % params['t']['hour'].to_i + '-%02d' % params['t']['minute'].to_i
    @situated = @scene.situated
    @option = params[:option]
    @long = params[:long]

    respond_to do |format|
      if @scene.update(scene_params)
        @scenes_wi = Scene.get_scenes_wi_to_array(@situated, nil, force: true)
        @scenes = @scenes_wi.collect{|x| Scene.find(x) }
#        format.html { redirect_to scene_path(@scene), notice: 'Scene was successfully updated.' }
        format.json { render :show, status: :ok, location: @scene }
        flash.now[:notice] = "Scene was successfully updated."
        #format.turbo_stream { render "shared/show", locals: { object: @scene, no_new_link: true  } }
        format.turbo_stream { render "shared/update", locals: { object: @scene, short: @short } }
      else
        format.html { render :edit, situated_type: @situated.class.name, situated_id: @situated.id }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenes/1
  # DELETE /scenes/1.json
  def destroy
    @situated = @scene.situated
    @option = params[:option]
    @long = params[:option]
    @toggle = params[:toggle]
    @print = params[:print]
    @year_options = []

    @scene.destroy

    @scenes_wi = Scene.get_scenes_wi_to_array(@situated, nil, force: true)
    @scenes = @scenes_wi.collect{|x| Scene.find(x) }
    respond_to do |format|
#      format.html { redirect_to polymorphic_url([@situated, :scenes]),  status: :see_other, notice: 'Scene was successfully destroyed.' }
      format.json { head :no_content }
      flash.now[:notice] = "Scene was successfully updated."
      format.turbo_stream { render "shared/destroy", locals: { object: Scene.new } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_scene
    @scene = Scene.find(params[:id].nil? ? params[:scene_id] : params[:id])
  end

  def set_situated
    @klass = [Book, Story].detect { |c| params["#{c.name.underscore}_id"] }
    if @klass.nil?
      key_point = KeyPoint.find(params[:key_point_id])
      @klass = key_point.scripted_type
      @situated = key_point.scripted
    else
      @situated = @klass.find((params[:scene].nil? || params[:scene][:situated_id].empty? ? params["#{@klass.name.underscore}_id"] : params[:scene][:situated_id]))
    end
  end

  # Only allow a list of trusted parameters through.
  def scene_params
    params.require(:scene).permit(:abc, :check, :summary, :place, :time, :scene_sequel, :goal_reaction, :conflict_dilemma, :disaster_decision, 
                                  :short_term_goal, :long_term_goal, :over_arching_goal, :situated_id, :book_id, :date_string,
                                  :situated_type, :selector, :key_point_id, :section_id, :insert_scene_id, :before_flag, :artifact_id, :position, :title_scene)
  end
end
