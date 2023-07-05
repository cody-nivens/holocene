class SectionsController < ApplicationController
  before_action :set_section, only: %i[map_locs geo_map timeline grid_params show edit update destroy]
  before_action :set_sectioned, only: %i[sort index new]

  def index
    @sections = @sectioned.sections.includes([:rich_text_body]).order(:position)
    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: Section.new, objects: @sections } }
    end
  end

  def sort
    if request.xhr?
      @section = Section.find(params[:section_id])
      @section.set_list_position(params[:section][:position].to_i)
      @section.save
      render body: nil
    else
      @sections = @sectioned.sections.order(:position)
      respond_to do |format|
        format.turbo_stream { render "shared/sort", locals: { return_path: @sectioned, link_object: @sectioned, object: Section.new, objects: @sections } }
      end
    end
  end


  def map_locs
    respond_to do |format|
      format.json { render json: @section.map_locs }
    end
  end

  def geo_map
    @object = @section
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @section, no_new_link: true, part: 'map', path_name: 'shared' } }
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @title = @section.name
    @sectioned = @section.sectioned
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @section } }
    end
  end

  # GET /sections/new
  def new
    @section = Section.new({ sectioned_type: @sectioned.class.name, sectioned_id: @sectioned.id })
  end

  # GET /sections/1/edit
  def edit
    @short = params[:short]
    @sectioned = @section.sectioned
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)
    @section.user = current_user
    @sectioned = @section.sectioned

    respond_to do |format|
      if @section.save
        update_metrics
        @sections = @sectioned.class.name == "Scene" ? Section.where(id: [ @sectioned.section.id ]) : @sectioned.sections.includes([:rich_text_body]).order(:position)
        if @sectioned.class.name == 'Chapter'
          @asides = @sectioned.asides
        end
        obj_name = @section.sectioned.class.name.underscore
        self.instance_variable_set("@#{obj_name}", @sectioned)
#        format.html { redirect_to polymorphic_path(@sectioned), notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
        flash.now[:notice] = "Section was successfully created."
        format.turbo_stream { render "shared/show", locals: { object: @section.sectioned } }
      else
        format.html { render :new, sectioned_type: @sectioned.class.name, sectioned_id: @sectioned.id }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    @short = params[:short]
    @sectioned = @section.sectioned
    respond_to do |format|
      if @section.update(section_params)
        @sections = @sectioned.class.name == "Scene" ? Section.where(id: [ @sectioned.section.id ]) : @sectioned.sections.includes([:rich_text_body]).order(:position)
        flash.now[:notice] = "Section was successfully updated."
        update_metrics
        if @sectioned.class.name == 'Chapter'
          @asides = @sectioned.asides
        end
#        format.html { redirect_to polymorphic_path(@sectioned), notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
        obj_name = @section.sectioned.class.name.underscore
        self.instance_variable_set("@#{obj_name}", @sectioned)
        #format.turbo_stream { render "shared/show", locals: { object: @section.sectioned } }
        format.turbo_stream { render "shared/update", locals: { object: @section, short: @short } }
      else
        format.turbo_stream { render :edit, locals: { object: @section } }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @sectioned = @section.sectioned
    @section.destroy
    respond_to do |format|
      @sections = @sectioned.sections.includes([:rich_text_body]).order(:position)
#      format.html { redirect_to polymorphic_url(@sectioned), notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
      if @sectioned.class.name == 'Chapter'
        @asides = @sectioned.asides
      end
      format.turbo_stream { flash.now[:notice] = "Section was successfully destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_section
    @section = Section.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_sectioned
    @klass = [Chapter, Scene].detect { |c| params["#{c.name.underscore}_id"] }
    @sectioned = @klass.find((params[:section].nil? || params[:section][:sectioned_id].empty? ? params["#{@klass.name.underscore}_id"] : params[:section][:sectioned_id]))
  end

  def update_metrics
    Metric.update_count(@section, @section.word_count, current_user)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def section_params
    params.require(:section).permit(:name, :body, :position, :sectioned_type, :sectioned_id, :display_name, :embed,
                                    :user_id)
  end
end
