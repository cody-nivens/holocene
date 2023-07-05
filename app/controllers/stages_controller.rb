class StagesController < ApplicationController
  before_action :set_stage, only: %i[ report add_characters list check show edit update destroy ]
  before_action :set_act, only: %i[index new]

  # GET /stages or /stages.json
  def index
    @stages = Stage.where(act_id: @act.id).order(:name)
    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: Stage.new, objects: @stages } }
    end
  end

  # GET /stages/1 or /stages/1.json
  def show
    @op = params[:op] || "locations"
    @check = params[:check]

    session[:stage_view] = @check
    session[:return_to] = request.fullpath
    session[:stage_id] = @stage.id
    save_user_datum(@stage.act.book.id, nil, nil, @stage.id)

    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @stage, new_link_path: "segments" } }
    end
  end
  
  def report
    @report_path , @report = params[:report].split(/\//)
    @toggle = params[:toggle]
    @print = params[:print]
    @option = params[:option]
    @long = params[:long]

    case @report
    when 'characters'
      setup_characters
    end

    respond_to do |format|
      format.turbo_stream { render 'shared/report', locals: { report: @report, report_path: @report_path } }
    end
  end

  def check
    @op = params[:op]
    @check = params[:check]
    session[:stage_view] = @check
  end

  def list
    session[:return_to] = request.fullpath
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @stage, part: 'list', no_new_link: true } }
    end
  end

  def time_by_location
    session[:return_to] = request.fullpath
  end

  def time_by_actor
    session[:return_to] = request.fullpath
  end

  def actor_by_location
    session[:return_to] = request.fullpath
  end

  def scenes
    session[:return_to] = request.fullpath
  end

  def setup_characters
#    session[:return_to] = request.fullpath

    @data = {}
    @characters = []

    scenes = Scene.get_scenes_to_array(@stage.act.book)
    scenes.each do |scene_id|
      scene = Scene.find(scene_id)
      characters = []
      if scene.segments.size > 0
        scene.segments.each do |segment|
          segment.location_times.includes(:location).order("locations.name").each do |location_time|
            location_time.actor_location_times.includes(:actor).order("actors.name").each do |actor_location_time|
              actor_location_time.actor.characters.order(:last_name, :first_name).each do |actor|
                @characters << actor unless @characters.include?(actor)
                characters << actor unless characters.include?(actor)
              end
            end
          end
        end
      end
      @data[scene] = characters.sort_by do |x|
        [x.last_name, x.first_name]
      end
    end
    chars = @characters.sort_by do |x|
      [x.last_name, x.first_name]
    end
    @characters = chars
  end

  def add_characters

    @data = {}
    @characters = []

    scenes = Scene.get_scenes_to_array(@stage.act.book)
    scenes.each do |scene_id|
      scene = Scene.find(scene_id)
      characters = []
      if scene.segments.size > 0
        scene.segments.each do |segment|
          segment.location_times.includes(:location).order("locations.name").each do |location_time|
            location_time.actor_location_times.includes(:actor).order("actors.name").each do |actor_location_time|
              actor_location_time.actor.characters.order(:last_name, :first_name).each do |character|
                characters << character if !scene.characters.include?(character) and !characters.include?(character)
              end
            end
          end
        end
      end

      characters.each do |character|
        scene.characters << character unless scene.characters.include?(character)
      end
    end
    respond_to do |format|
      format.html { redirect_to stage_characters_url(@stage), notice: "Characters were successfully synced." }
    end

  end

  # GET /stages/new
  def new
    @stage = Stage.new
    @stage.act = @act
  end

  # GET /stages/1/edit
  def edit
    @short = params[:short]
  end

  # POST /stages or /stages.json
  def create
    @stage = Stage.new(stage_params)
    @act = @stage.act
    @stages = Stage.where(act_id: @act.id).order(:name)

    respond_to do |format|
      if @stage.save
#        format.html { redirect_to stage_url(@stage), notice: "Stage was successfully created." }
        format.json { render :show, status: :created, location: @stage }
        format.turbo_stream { flash.now[:notice] = "Stage was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stages/1 or /stages/1.json
  def update
    @short = params[:short]
    respond_to do |format|
      if @stage.update(stage_params)
        @stages = Stage.where(act_id: @act.id).order(:name)
#        format.html { redirect_to stage_url(@stage), notice: "Stage was successfully updated." }
        format.json { render :show, status: :ok, location: @stage }
        flash.now[:notice] = "Stage was successfully updated."
        format.turbo_stream { render "shared/update", locals: { object: @stage, short: @short } }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stages/1 or /stages/1.json
  def destroy
    @act = @stage.act
    @stage.destroy

    @stages = Stage.where(act_id: @act.id).order(:name)
    respond_to do |format|
#      format.html { redirect_to act_stages_url(@act), notice: "Stage was successfully destroyed." }
      format.json { head :no_content }
        format.turbo_stream { flash.now[:notice] = "Stage was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage
      @stage = Stage.find(params[:id])
      session[:stage_id] = @stage.id
      @act = @stage.act
      @book = @act.book
    end

    def set_act
      @act = Act.find(params[:act_id])
    end

    # Only allow a list of trusted parameters through.
    def stage_params
      params.require(:stage).permit(:name, :act_id, :desc)
    end
end
