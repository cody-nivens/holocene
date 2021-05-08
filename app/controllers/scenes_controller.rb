class ScenesController < ApplicationController
  before_action :set_scene, only: [:moved, :move, :show, :edit, :update, :destroy]
  before_action :set_situated, only: [ :index, :create, :new, :destroy]

  # GET /scenes
  # GET /scenes.json
  def index
    @toggle = params[:toggle]
    @print = params[:print]

    @scenes = Scene.where("situated_type = ? and situated_id =?", @klass, @situated.id)

     stories = nil
    if @situated.class.name == 'Book'
       stories = @situated.stories.order(:position)
    else
      stories = [ @situated ]
    end

    scene_ids = []

    stories.each do |story|
      story.key_points.order(:position).each do |key_point|
        key_point.scenes.order(:time,:abc).each do |scene|
          unless @toggle == "on"
              scenes = Scene.where(insert_scene_id: scene.id)
              scenes.each do |scene_2|
                scene_ids << scene_2
              end
           end
           scene_ids << scene.id
        end
      end
    end

    if @toggle == "on"
      @scenes = Scene.where("id in (?)", scene_ids).order(:abc)
    else
      @scenes = Scene.where("id in (?)", scene_ids).order(:time, :abc)
    end
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

    respond_to do |format|
      if @scene.update({:key_point_id => params[:new_key_point_id], :selector => params[:new_selector]})
        format.html { redirect_to polymorphic_path(@scene), notice: 'Scene was successfully moved.' }
      else
        format.html { render :move, situated_tyep: @situated.class.name, situated_id: @situated.id }
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
    @scene.time = time

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
    @scene.time = time
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
                                    :situated_type, :selector, :key_point_id, :section_id, :insert_scene_id, :before_flag)
    end
end
