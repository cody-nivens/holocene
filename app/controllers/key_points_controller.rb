class KeyPointsController < ApplicationController
  before_action :set_key_point, only: [:moved, :move, :show, :list, :add, :edit, :update, :destroy]
  before_action :set_scripted, only: [:moved, :move, :index, :list, :add, :new ]


  # GET /key_points
  # GET /key_points.json
  def index
    @key_points = @scripted.key_points.order(:position)
  end

  def moved
    @key_point.update_attributes({:scripted_id => params["new_#{@scripted.class.name.underscore}_id".to_sym]})

    respond_to do |format|
       format.html { redirect_to polymorphic_path([@scripted ])}
    end

  end

  def move
  end

  def list
    @selector = (params[:selector].blank? ? 0 : params[:selector])
  end

  def add
    scenes_avail = params[:scenes_avail]
    scenes_ids = params[:scenes_ids]
    selector = (params[:selector].blank? ? 0 : params[:selector])

    unless scenes_avail.nil?
      scenes_avail.each do |scene_id|
        next if scene_id.blank?
        scene = Scene.find(scene_id)
        scene.update_attribute("selector", selector)
        @key_point.scenes << scene unless @key_point.scenes.include?(scene)
      end
    end

    unless scenes_ids.nil?
      scenes_ids.each do |scene_id|
        next if scene_id.blank?
        scene = Scene.find(scene_id)
        scene.update_attribute("selector", 0)
      end
    end


    respond_to do |format|
       format.html { redirect_to polymorphic_path([@scripted, :key_point_list])}
    end
  end

  # GET /key_points/1
  # GET /key_points/1.json
  def show
    @scripted = @key_point.scripted
  end

  # GET /key_points/new
  def new
    @key_point = KeyPoint.new
    @key_point.scripted = @scripted
  end

  # GET /key_points/1/edit
  def edit
    @scripted = @key_point.scripted
  end

  # POST /key_points
  # POST /key_points.json
  def create
    @key_point = KeyPoint.new(key_point_params)
    @scripted = @key_point.scripted
    @klass = @scripted.class

    respond_to do |format|
      if @key_point.save
        format.html { redirect_to polymorphic_url([@scripted, @key_point]), notice: 'Key point was successfully created.' }
        format.json { render :show, status: :created, location: @key_point }
      else
        format.html { render :new }
        format.json { render json: @key_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_points/1
  # PATCH/PUT /key_points/1.json
  def update
    @scripted = @key_point.scripted
    respond_to do |format|
      if @key_point.update(key_point_params)
        format.html { redirect_to polymorphic_url([@scripted, @key_point]), notice: 'Key point was successfully updated.' }
        format.json { render :show, status: :ok, location: @key_point }
      else
        format.html { render :edit }
        format.json { render json: @key_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_points/1
  # DELETE /key_points/1.json
  def destroy
    @scripted = @key_point.scripted
    @key_point.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_url([@scripted, :key_points]), notice: 'Key point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key_point
      @key_point = KeyPoint.find(params[:id])
      @scripted = @key_point.scripted
      @klass = @scripted.class
    end

    def set_scripted
      @klass = [Book, Chapter, Story].detect{|c| params["#{c.name.underscore}_id"]}
      @scripted = @klass.find((params[:key_point].nil? || params[:key_point][:scripted_id].empty? ? params["#{@klass.name.underscore}_id"] : params[:key_point][:scripted_id]))
    end

    # Only allow a list of trusted parameters through.
    def key_point_params
      params.require(:key_point).permit(:hook, :inciting_incident, :key_element, :first_plot_point, :first_pinch_point, :midpoint, :second_pinch_point, :third_plot_point, :climax, :scripted_id, :scripted_type, :selector)
    end
end
