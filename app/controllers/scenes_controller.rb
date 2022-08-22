class ScenesController < ApplicationController
  before_action :set_scene, only: %i[moved move show edit update destroy]
  before_action :set_situated, only: %i[timeline index new]

  # GET /scenes
  # GET /scenes.json
  def index
    @toggle = params[:toggle]
    @print = params[:print]
    @option = params[:option]

    @year = params[:year]
    @scenes = @no_scene ? nil : Scene.get_scenes(@situated, @toggle)
    unless @scenes.nil?
      @years =  @scenes.keys.sort
      if @year.nil?
        @scenes = @scenes
        @year = @years[0] if @year.nil?
      end

      @year_options = []
      @years.each do |year|
        @year_options << [year, year]
      end
    end

    respond_to do |format|
      format.html {}
      format.json {}
      format.js {}
    end
  end

  def sort
    # @list = List.find(params[:list_id])
    @scene = Scene.find(params[:scene_id])
    @scene.update(scene_params)
    render body: nil
  end

  # GET /scenes/1
  # GET /scenes/1.json
  def show
    @title = @scene.name
    @situated = @scene.situated
  end

  def move
    @situated = @scene.situated
    @key_point = @scene.key_point
  end

  def moved
    @situated = @scene.situated
    @key_point = @scene.key_point
    @selector = params[:selector]
    @new_selector = params[:new_selector]
    title = @key_point.selector_value(@selector)
    @scene.situated = @key_point.scripted
    @scene.save

    respond_to do |format|
      if params[:new_key_point_id].present? && @scene.update({ key_point_id: params[:new_key_point_id],
                                                               selector: @new_selector })
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
    @scene.date_string = '%04d' % params['t_years'].to_i + '-%02d' % params['t']['month'].to_i + '-%02d' % params['t']['day'].to_i + '-%02d' % params['t']['hour'].to_i + '-%02d' % params['t']['minute'].to_i

    respond_to do |format|
      if @scene.save
        format.html { redirect_to scene_path(@scene), notice: 'Scene was successfully created.' }
        format.json { render :show, status: :created, location: @scene }
      else
        format.html { render :new, situated_type: @situated.class.name, situated_id: @situated.id }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scenes/1
  # PATCH/PUT /scenes/1.json
  def update
    @scene.date_string = '%04d' % params['t_years'].to_i + '-%02d' % params['t']['month'].to_i + '-%02d' % params['t']['day'].to_i + '-%02d' % params['t']['hour'].to_i + '-%02d' % params['t']['minute'].to_i
    @situated = @scene.situated

    respond_to do |format|
      if @scene.update(scene_params)
        format.html { redirect_to scene_path(@scene), notice: 'Scene was successfully updated.' }
        format.json { render :show, status: :ok, location: @scene }
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
    @scene.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_url([@situated, :scenes]), notice: 'Scene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_scene
    @scene = Scene.find(params[:id])
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
                                  :short_term_goal, :long_term_goal, :over_arching_goal, :situated_id,
                                  :situated_type, :selector, :key_point_id, :section_id, :insert_scene_id, :before_flag, :artifact_id, :position_position)
  end
end
