class ScenesController < ApplicationController
  before_action :set_scene, only: [:moved, :move, :show, :edit, :update, :destroy]
  before_action :set_situated, only: [ :timeline, :index, :create, :new, :destroy]

  # GET /scenes
  # GET /scenes.json
  def index
    @toggle = params[:toggle]
    @print = params[:print]

    @scenes = Scene.get_scenes(@situated, @toggle)
  end

   def sort
    #@list = List.find(params[:list_id])
    @scene = Scene.find(params[:scene_id])
    @scene.update(scene_params)
    render body: nil
  end

  # GET /scenes/1
  # GET /scenes/1.json
  def show
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

    respond_to do |format|
      if !params[:new_key_point_id].blank? && @scene.update({:key_point_id => params[:new_key_point_id], :selector => @new_selector})
        @scene.key_point.selector_value_set(@new_selector, title)
        @scene.key_point.save
        format.html { redirect_to polymorphic_path(@scene), notice: 'Scene was successfully moved.' }
      else
        format.html { render :move, situated_tyep: @situated.class.name, situated_id: @situated.id, new_key_point_id: @key_point.id }
      end
    end
  end

  # GET /scenes/new
  def new
    @scene = Scene.new
    @scene.situated = @situated
    @kp_klass = [KeyPoint ].detect{|c| params["#{c.name.underscore}_id"]}
    @key_point = (params[:key_point_id].nil? ? nil : @kp_klass.find(params[:key_point_id]))
    @selector = params[:selector]
    @scene.selector = @selector
    @scene.key_point = @key_point
  end

  # GET /scenes/1/edit
  def edit
    @situated = @scene.situated
    @kp_klass = [KeyPoint ].detect{|c| params["#{c.name.underscore}_id"]}
    @key_point = (params[:key_point_id].nil? ? nil : @kp_klass.find(params[:key_point_id]))
    @selector = params[:selector]
  end

  # POST /scenes
  # POST /scenes.json
  def create
    time = params["t_years"].to_d + params["t"]["month"].to_f/12 + params["t"]["day"].to_f/365
    @scene = Scene.new(scene_params)
    @scene.time = time.truncate(4)

    respond_to do |format|
      if @scene.save
        format.html { redirect_to polymorphic_path([@situated, @scene]), notice: 'Scene was successfully created.' }
        format.json { render :show, status: :created, location: @scene }
      else
        format.html { render :new, situated_type: @klass.name, situated_id: @situated.id }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scenes/1
  # PATCH/PUT /scenes/1.json
  def update
    time = params["t_years"].to_d + params["t"]["month"].to_f/12 + params["t"]["day"].to_f/365
    @scene.time = time.truncate(4)
    @situated = @scene.situated

    respond_to do |format|
      if @scene.update(scene_params)
        format.html { redirect_to polymorphic_path([@situated, @scene]), notice: 'Scene was successfully updated.' }
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
      @klass = [Book, Chapter, Story].detect{|c| params["#{c.name.underscore}_id"]}
      @situated = @klass.find((params[:scene].nil? || params[:scene][:situated_id].empty? ? params["#{@klass.name.underscore}_id"] : params[:scene][:situated_id]))
    end


    # Only allow a list of trusted parameters through.
    def scene_params
      params.require(:scene).permit(:abc, :check, :summary, :place, :time, :scene_sequel, :goal_reaction, :conflict_dilemma, :disaster_decision, :short_term_goal, :long_term_goal, :over_arching_goal, :situated_id,
                                    :situated_type, :selector, :key_point_id, :section_id, :insert_scene_id, :before_flag, :artifact_id, :position_position)
    end
end
