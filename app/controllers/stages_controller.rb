class StagesController < ApplicationController
  before_action :set_stage, only: %i[ check show edit update destroy ]
  before_action :set_act, only: %i[index new]

  # GET /stages or /stages.json
  def index
    @stages = Stage.where(act_id: @act.id).order(:name)
  end

  # GET /stages/1 or /stages/1.json
  def show
    @op = params[:op] || "locations"
    @check = params[:check]
    session[:stage_view] = @check
    session[:return_to] = request.fullpath
  end
  
  def check
    @op = params[:op]
    @check = params[:check]
    session[:stage_view] = @check
  end

  # GET /stages/new
  def new
    @stage = Stage.new
    @stage.act = @act
  end

  # GET /stages/1/edit
  def edit
  end

  # POST /stages or /stages.json
  def create
    @stage = Stage.new(stage_params)
    @act = @stage.act

    respond_to do |format|
      if @stage.save
        format.html { redirect_to stage_url(@stage), notice: "Stage was successfully created." }
        format.json { render :show, status: :created, location: @stage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stages/1 or /stages/1.json
  def update
    respond_to do |format|
      if @stage.update(stage_params)
        format.html { redirect_to stage_url(@stage), notice: "Stage was successfully updated." }
        format.json { render :show, status: :ok, location: @stage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stages/1 or /stages/1.json
  def destroy
    @stage.destroy

    respond_to do |format|
      format.html { redirect_to act_stages_url(@act), notice: "Stage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage
      @stage = Stage.find(params[:id])
      @act = @stage.act
    end

    def set_act
      @act = Act.find(params[:act_id])
    end

    # Only allow a list of trusted parameters through.
    def stage_params
      params.require(:stage).permit(:name, :act_id, :desc)
    end
end
