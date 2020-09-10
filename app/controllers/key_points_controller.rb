class KeyPointsController < ApplicationController
  before_action :set_key_point, only: [:show, :edit, :update, :destroy]
  before_action :set_scripted, only: [:index, :new ]


  # GET /key_points
  # GET /key_points.json
  def index
    @key_points = @scripted.key_points
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
      format.html { redirect_to polymorphic_url([@scripted, 'key_points']), notice: 'Key point was successfully destroyed.' }
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
      @klass = (params[:key_point].nil? || params[:key_point][:scripted_type].empty? ? params[:scripted_type] : params[:key_point][:scripted_type]).capitalize.constantize
      @scripted = @klass.find((params[:key_point].nil? || params[:key_point][:scripted_id].empty? ? params["#{@klass.name.underscore}_id"] : params[:key_point][:scripted_id]))
    end

    # Only allow a list of trusted parameters through.
    def key_point_params
      params.require(:key_point).permit(:hook, :inciting_incident, :key_element, :first_plot_point, :first_pinch_point, :midpoint, :second_pinch_point, :third_plot_point, :climax, :scripted_id, :scripted_type)
    end
end
