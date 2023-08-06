class KeyPointsController < ApplicationController
  before_action :set_key_point, only: %i[show moved move list add edit update]
  before_action :set_scripted, only: %i[moved move index list add new]

  # GET /key_points
  # GET /key_points.json
  def index
    @key_points = @scripted.key_points.order(:position)
    @link = false

    if request.xhr?
      respond_to do |format|
        format.json { render json: { key_points: @key_points } }
      end
    else
      respond_to do |format|
        format.turbo_stream { render "shared/index", locals: { object: KeyPoint.new, objects: @key_points } }
      end
    end
  end

  def sort
    if request.xhr?
      @key_point = KeyPoint.find(params[:key_point_id])
      @key_point.set_list_position(params[:key_point][:position].to_i)
      @key_point.save
      render body: nil
    else
      @story = Story.find(params[:story_id])
      @key_points = @story.key_points.order(:position)
      respond_to do |format|
        format.turbo_stream { render "shared/sort", locals: { link_object: @story, object: KeyPoint.new, objects: @key_points } }
      end
    end
  end


  def moved
    @key_point.update({ scripted_id: params["new_#{@scripted.class.name.underscore}_id".to_sym], scripted_type: @scripted.class.name })
    @key_point.scenes.each do |scene|
      scene.situated = @scripted
      scene.book = @scripted.book
      scene.save
    end

    respond_to do |format|
#      format.html { redirect_to polymorphic_url(@scripted), notice: 'Key Point successfully moved.' }
      format.json { render :show, status: :ok, location: @key_point }
      flash.now[:notice] = "Key Point was successfully moved."
      format.turbo_stream { render "shared/show", locals: { object: @scripted } }
    end
  end

  def move
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @key_point , part: 'move', no_new_link: true } }
    end
  end

  def list
    @selector = (params[:selector] || 0)
    @long = params[:long]
    @situated = @key_point

    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @key_point , part: 'list', new_link_path: 'scenes' } }
    end

  end

  def add
    scenes_avail = params[:scenes_avail]
    scenes_ids = params[:scenes_ids]
    selector = (params[:selector].presence || 0)

    unless scenes_avail.nil?
      scenes_avail.each do |scene_id|
        next if scene_id.blank?

        scene = Scene.find(scene_id)
        scene.update({ selector: selector, key_point_id: @key_point.id })
        # @key_point.scenes << scene unless @key_point.scenes.include?(scene)
      end
    end

    unless scenes_ids.nil?
      scenes_ids.each do |scene_id|
        next if scene_id.blank?

        scene = Scene.find(scene_id)
        scene.update({ selector: 0, key_point_id: nil })
      end
    end

    respond_to do |format|
      format.html { redirect_to polymorphic_path([@scripted, :key_point_list], selector: selector) }
    end
  end

  # GET /key_points/1
  # GET /key_points/1.json
  def show
    #@key_point = KeyPoint.includes({ scenes: [:artifact, :rich_text_place, :rich_text_summary, :insert_scene, :characters, { section: :rich_text_body }, { character_scenes: [:character, :rich_text_summary] }]}).find(params[:id])
    @klass = @key_point.scripted.class
    @title = @key_point.name
    @scripted = @key_point.scripted
    instance_variable_set("@#{(@klass.name == 'Book' ? 'book' : (@klass.name == 'Story' ? 'story' : 'chapter'))}", @scripted)
    @long = params[:long]
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @key_point } }
    end
  end

  def view
    @key_point = KeyPoint.includes({ scenes: [:artifact, :rich_text_place, :rich_text_summary, :insert_scene, :characters, { section: :rich_text_body }, { character_scenes: [:character, :rich_text_summary] }]}).find(params[:id].nil? ? params[:key_point_id] : params[:id])
    @klass = @scripted.class
    @title = @key_point.name
    @scripted = @key_point.scripted
    @long = params[:long]
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @key_point, part: 'view', no_new_link: true } }
    end
  end

  # GET /key_points/new
  def new
    @key_point = KeyPoint.new
    @key_point.scripted = @scripted
    @long = params[:long]
  end

  # GET /key_points/1/edit
  def edit
    @short = params[:short]
    @scripted = @key_point.scripted
    @long = params[:long]
  end

  # POST /key_points
  # POST /key_points.json
  def create
    @key_point = KeyPoint.new(key_point_params)
    @scripted = @key_point.scripted
    @klass = @scripted.class
    @key_points = @scripted.key_points
    @long = params[:long]

    respond_to do |format|
      if @key_point.save
        format.html { redirect_to key_point_url(@key_point), notice: 'Key point was successfully created.' }
        format.json { render :show, status: :created, location: @key_point }
        format.turbo_stream { flash.now[:notice] = "Key Point was successfully created." }
      else
        format.html { render :new }
        format.json { render json: @key_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_points/1
  # PATCH/PUT /key_points/1.json
  def update
    @short = params[:short]
    @scripted = @key_point.scripted
    @long = params[:long]
    respond_to do |format|
      if @key_point.update(key_point_params)
        format.html { redirect_to key_point_url(@key_point), notice: 'Key point was successfully updated.' }
        format.json { render :show, status: :ok, location: @key_point }
        flash.now[:notice] = "Key Point was successfully updated."
        format.turbo_stream { render "shared/update", locals: { object: @key_point, short: @short } }
      else
        format.html { render :edit }
        format.json { render json: @key_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_points/1
  # DELETE /key_points/1.json
  def destroy
    @long = params[:long]
    @key_point = KeyPoint.includes({ scenes: [:artifact, :rich_text_place, :rich_text_summary, :insert_scene, :characters,
                                              :rich_text_goal_reaction, :rich_text_conflict_dilemma, :rich_text_disaster_decision,
                                              :rich_text_short_term_goal, :rich_text_long_term_goal, :rich_text_over_arching_goal,
                                              { section: :rich_text_body }, { character_scenes: [:character, :rich_text_summary] }]}).find(params[:id])
    @scripted = @key_point.scripted
    @key_point.destroy
    @key_points = @scripted.key_points
    respond_to do |format|
      format.html do
        redirect_to polymorphic_url([@scripted, :key_points]), notice: 'Key point was successfully destroyed.'
      end
      flash.now[:now] = "Key Point was successfully destroyed."
      format.turbo_stream { render "shared/destroy", locals: { object: KeyPoint.new } }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_key_point
    @key_point = KeyPoint.find(params[:id].nil? ? params[:key_point] : params[:id])
    @scripted = @key_point.scripted
    @klass = @scripted.class
  end

  def set_scripted
    @klass = [Book, Chapter, Story].detect { |c| params["#{c.name.underscore}_id"] }
    @scripted = @klass.find((params[:key_point].nil? || params[:key_point][:scripted_id].empty? ? params["#{@klass.name.underscore}_id"] : params[:key_point][:scripted_id]))
    instance_variable_set("@#{(@klass.name == 'Book' ? 'book' : (@klass.name == 'Story' ? 'story' : 'chapter'))}", @scripted)
  end

  # Only allow a list of trusted parameters through.
  def key_point_params
    params.require(:key_point).permit(:hook, :inciting_incident, :key_element, :first_plot_point, :first_pinch_point,
                                      :midpoint, :second_pinch_point, :third_plot_point, :climax, :scripted_id,
                                      :scripted_type, :selector, :print_name, :print_points, :position)
  end
end
