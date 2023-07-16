class CharacterAttributesController < ApplicationController
  before_action :set_character_attribute, only: %i[show edit update destroy]
  before_action :set_character_category, only: %i[index new]

  # GET /character_attributes
  # GET /character_attributes.json
  def index
    @character_categories = CharacterCategory.all
    @character_attributes = CharacterAttribute.where(character_category_id: @character_category.id)

    if request.xhr?
      respond_to do |format|
        format.json do
          render json: { character_attributes: @character_attributes }
        end
      end
    else
      respond_to do |format|
        format.turbo_stream { render "shared/index", locals: { object: CharacterAttribute.new, objects: @character_attributes } }
      end
    end
  end

  def sort
    if request.xhr?
      @character_attribute = CharacterAttribute.find(params[:character_attribute_id])
      @character_attribute.set_list_position(params[:character_attribute][:position].to_i)
      @character_attribute.save
      render body: nil
    else
      @character_category = CharacterCategory.find(params[:character_category_id])
      @character_attributes = @character_category.character_attributes.order(:position)
      respond_to do |format|
        format.turbo_stream { render "shared/sort", locals: { link_object: @character_category, object: CharacterAttribute.new, objects: @character_attributes, return_path: @character_category } }
      end
    end
  end


  # GET /character_attributes/1
  # GET /character_attributes/1.json
  def show
    @character_category = @character_attribute.character_category
      respond_to do |format|
        format.turbo_stream { render "shared/show", locals: { object: @character_attribute } }
      end
  end

  # GET /character_attributes/new
  def new
    @character_attribute = CharacterAttribute.new
    @character_attribute.character_category_id = @character_category.id
  end

  # GET /character_attributes/1/edit
  def edit
    @short = params[:short]
    @character_category = @character_attribute.character_category
  end

  # POST /character_attributes
  # POST /character_attributes.json
  def create
    @character_attribute = CharacterAttribute.new(character_attribute_params)
    @character_category = @character_attribute.character_category

    respond_to do |format|
      if @character_attribute.save
        @character_attributes = CharacterAttribute.where(character_category_id: @character_category.id)
#        format.html { redirect_to @character_attribute, notice: 'Character attribute was successfully created.' }
        format.json { render :show, status: :created, location: @character_attribute }
        flash.now[:notice] = "Character Attribute was successfully created."
        format.turbo_stream { render "shared/index", locals: { object: CharacterAttribute.new, objects: @character_attributes } }
      else
        format.html { render :new, character_category_id: @character_category.id }
        format.json { render json: @character_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_attributes/1
  # PATCH/PUT /character_attributes/1.json
  def update
    @short = params[:short]
    @character_category = @character_attribute.character_category
    respond_to do |format|
      if @character_attribute.update(character_attribute_params)
#        format.html { redirect_to @character_attribute, notice: 'Character attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_attribute }
        flash.now[:notice] = "Character Attribute was successfully updated."
        format.turbo_stream { render "shared/update", locals: { object: @character_attribute, short: @short } }
      else
        format.html { render :edit }
        format.json { render json: @character_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_attributes/1
  # DELETE /character_attributes/1.json
  def destroy
    @character_category = @character_attribute.character_category
    @character_attribute.destroy
    @character_attributes = CharacterAttribute.where(character_category_id: @character_category.id)
    respond_to do |format|
#      format.html do
#        redirect_to character_category_character_attributes_url(character_category_id: @character_category.id),
#                    notice: 'Character attribute was successfully destroyed.'
#      end
      format.json { head :no_content }
      flash.now[:now] = "Character Attribute was successfully destroyed."
      format.turbo_stream { render "shared/destroy", locals: { object: CharacterAttribute.new } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character_attribute
    @character_attribute = CharacterAttribute.find(params[:id])
  end

  def set_character_category
    @character_category = CharacterCategory.find(params[:character_category_id])
  end

  # Only allow a list of trusted parameters through.
  def character_attribute_params
    params.require(:character_attribute).permit(:name, :character_category_id, :related_id, :position)
  end
end
