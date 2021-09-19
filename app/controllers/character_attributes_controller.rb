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
    end
  end

  # GET /character_attributes/1
  # GET /character_attributes/1.json
  def show
    @character_category = @character_attribute.character_category
  end

  # GET /character_attributes/new
  def new
    @character_attribute = CharacterAttribute.new
    @character_attribute.character_category_id = @character_category.id
  end

  # GET /character_attributes/1/edit
  def edit
    @character_category = @character_attribute.character_category
  end

  # POST /character_attributes
  # POST /character_attributes.json
  def create
    @character_attribute = CharacterAttribute.new(character_attribute_params)
    @character_category = @character_attribute.character_category

    respond_to do |format|
      if @character_attribute.save
        format.html { redirect_to @character_attribute, notice: 'Character attribute was successfully created.' }
        format.json { render :show, status: :created, location: @character_attribute }
      else
        format.html { render :new, character_category_id: @character_category.id }
        format.json { render json: @character_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_attributes/1
  # PATCH/PUT /character_attributes/1.json
  def update
    @character_category = @character_attribute.character_category
    respond_to do |format|
      if @character_attribute.update(character_attribute_params)
        format.html { redirect_to @character_attribute, notice: 'Character attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_attribute }
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
    respond_to do |format|
      format.html do
        redirect_to character_category_character_attributes_url(character_category_id: @character_category.id),
                    notice: 'Character attribute was successfully destroyed.'
      end
      format.json { head :no_content }
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
    params.require(:character_attribute).permit(:name, :character_category_id, :related_id)
  end
end
