class SegmentsController < ApplicationController
  before_action :set_segment, only: %i[ show edit update destroy ]
  before_action :set_stage, only: %i[index new]

  # GET /segments or /segments.json
  def index
    @segments = Segment.where(stage_id: @stage.id).order(:name)
    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: Segment.new, objects: @segments } }
    end
  end

  # GET /segments/1 or /segments/1.json
  def show
    @segments = Segment.where(stage_id: @stage.id).order(:name)
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @segment } }
    end
  end

  def sort
    if request.xhr?
      @segment = Segment.find(params[:segment_id])
      @segment.set_list_position(params[:segment][:position].to_i)
      @segment.save
      render body: nil
    else
      @stage = Stage.find(params[:stage_id])
      @segments = @stage.segments.order(:position)
      respond_to do |format|
        format.turbo_stream { render "shared/sort", locals: { link_object: @stage, object: Segment.new, objects: @segments } }
      end
    end
  end

  # GET /segments/new
  def new
    @segment = Segment.new
    @segment.stage = @stage
  end

  # GET /segments/1/edit
  def edit
    @short = params[:short]
  end

  # POST /segments or /segments.json
  def create
    @segment = Segment.new(segment_params)
    @stage = @segment.stage

    respond_to do |format|
      if @segment.save
        @segments = Segment.where(stage_id: @stage.id).order(:name)
#        format.html { redirect_to segment_url(@segment), notice: "Segment was successfully created." }
        format.json { render :show, status: :created, location: @segment }
        format.turbo_stream { flash.now[:notice] = "Segment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /segments/1 or /segments/1.json
  def update
    @short = params[:short]
    @segments = Segment.where(stage_id: @stage.id).order(:name)
    respond_to do |format|
      if @segment.update(segment_params)
#        format.html { redirect_to segment_url(@segment), notice: "Segment was successfully updated." }
        format.json { render :show, status: :ok, location: @segment }
        flash.now[:notice] = "Segment was successfully updated."
        format.turbo_stream { render "shared/update", locals: { object: @segment, short: @short } }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /segments/1 or /segments/1.json
  def destroy
    @stage = @segment.stage
    @segment.destroy

    @segments = Segment.where(stage_id: @stage.id).order(:name)
    respond_to do |format|
      format.html { redirect_to stage_segments_url(@stage), notice: "Segment was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream { flash.now[:notice] = "Segment was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between segments.
    def set_segment
      @segment = Segment.find(params[:id])
      @stage = @segment.stage
    end

    def set_stage
      @stage = Stage.find(params[:stage_id])
    end

    # Only allow a list of trusted parameters through.
    def segment_params
      params.require(:segment).permit(:stage_id, :name, :desc, :scene_id)
    end
end
