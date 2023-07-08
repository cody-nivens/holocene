class PlotPointsController < ApplicationController
  before_action :set_plot_point, only: %i[ list add show edit update destroy ]
  before_action :set_book, only: %i[ index new create ]

  # GET /plot_points or /plot_points.json
  def index
    @plot_points = PlotPoint.where(book_id: @book.id)
    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: PlotPoint.new, objects: @plot_points } }
    end
  end

  # GET /plot_points/1 or /plot_points/1.json
  def show
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @plot_point } }
    end
  end

  # GET /plot_points/new
  def new
    @plot_point = PlotPoint.new
    @plot_point.book = @book
  end

  # GET /plot_points/1/edit
  def edit
    @short = params[:short]
    @book = @plot_point.book
  end

  # GET /plot_points/1/list
  def list
    respond_to do |format|
      format.turbo_stream { }
    end
  end

    # GET /characters/1/add
  def add
    scenes_avail = params[:scenes_avail]
    scenes_ids = params[:scenes_ids]

    unless scenes_avail.nil?
      scenes_avail.each do |scene_id|
        next if scene_id.blank?

        scene = Scene.find(scene_id)
        update_scene_lists(@plot_point, scene)
      end
    end

    unless scenes_ids.nil?
      scenes_ids.each do |scene_id|
        next if scene_id.blank?

        scene = Scene.find(scene_id)
        @plot_point.scenes.destroy(scene) if @plot_point.scenes.include?(scene)
      end
    end

    respond_to do |format|
      format.html { redirect_to plot_points_list_path(@plot_point) }
    end
  end

  # POST /plot_points or /plot_points.json
  def create
    @plot_point = PlotPoint.new(plot_point_params)

    respond_to do |format|
      if @plot_point.save
        @plot_points = PlotPoint.where(book_id: @book.id)
#        format.html { redirect_to book_plot_points_url(@plot_point.book), notice: "Plot point was successfully created." }
        format.json { render :show, status: :created, location: @plot_point }
        flash.now[:notice] = "Plot Point was successfully created."
        format.turbo_stream { render "shared/index", locals: { object: PlotPoint.new, objects: @plot_points } }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plot_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plot_points/1 or /plot_points/1.json
  def update
    @short = params[:short]
    @plot_points = PlotPoint.where(book_id: @book.id)
    respond_to do |format|
      if @plot_point.update(plot_point_params)
        format.html { redirect_to plot_point_url(@plot_point), notice: "Plot point was successfully updated." }
        format.json { render :show, status: :ok, location: @plot_point }
        flash.now[:notice] = "Plot Point was successfully updated."
        format.turbo_stream { render "shared/update", locals: { object: @plot_point, short: @short } }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plot_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plot_points/1 or /plot_points/1.json
  def destroy
    @book = @plot_point.book
    @plot_point.destroy

    @plot_points = PlotPoint.where(book_id: @book.id)

    respond_to do |format|
      format.html { redirect_to book_plot_points_url(@book), notice: "Plot point was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream { flash.now[:notice] = "Plot Point was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plot_point
      @plot_point = PlotPoint.find(params[:id])
      @book = @plot_point.book
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Only allow a list of trusted parameters through.
    def plot_point_params
      params.require(:plot_point).permit(:name, :book_id, :body)
    end

    def update_scene_lists(plot_point, scene)
      plot_point.scenes << scene unless plot_point.scenes.include?(scene)
    end
end
