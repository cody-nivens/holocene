class SectionsController < ApplicationController
  before_action :set_section, only: [:geo_map, :timeline, :grid_params, :show, :edit, :update, :destroy]
  before_action :set_sectioned, only: [:index, :new, :edit, :create, :update, :destroy]

  def index
    @sections = @sectioned.sections.order(:position)
  end

  def geo_map
      @object = @section
  end


  # GET /sections/1
  # GET /sections/1.json
  def show
      @sectioned = @section.sectioned
  end

  # GET /sections/new
  def new
    @section = Section.new({:sectioned_type => @sectioned.class.name, :sectioned_id => @sectioned.id})
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)
    @section.sectioned = @sectioned

    respond_to do |format|
      if @section.save
        format.html { redirect_to polymorphic_path([@sectioned, @section]), notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to polymorphic_path([@sectioned,@section]), notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_url(@sectioned), notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_sectioned
      @klass = [Chapter, Scene].detect{|c| params["#{c.name.underscore}_id"]}
      @sectioned = @klass.find((params[:section].nil? || params[:section][:sectioned_id].empty? ? params["#{@klass.name.underscore}_id"] : params[:section][:sectioned_id]))
      #@scripted = @sectioned.scripted
      #  @klass = @scripted.class
      #end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:name, :body, :position, :sectioned_type, :sectioned_id, :display_name, :embed)
    end
end
