class CharacterValuesController < ApplicationController
  before_action :set_character_value, only: %i[show edit update destroy]
  before_action :set_character, only: %i[index new]

  # GET /character_values
  # GET /character_values.json
  def index
    @character_values = CharacterValue.where(character_id: @character.id)
  end

  # GET /character_values/1
  # GET /character_values/1.json
  def show
    @character = @character_value.character
  end

  # GET /character_values/new
  def new
    @character_value = CharacterValue.new
    @character_value.character_id = @character.id
    @character_category = CharacterCategory.first
  end

  # GET /character_values/1/edit
  def edit
    @character = @character_value.character
    @character_category = CharacterCategory.first
  end

  # POST /character_values
  # POST /character_values.json
  def create
    @character_value = CharacterValue.new(character_value_params)
    @character = Character.find(@character_value.character_id)

    respond_to do |format|
      if @character_value.save
        format.html do
          redirect_to polymorphic_path([@character, :character_values]),
                      notice: 'Character value was successfully created.'
        end
        format.json { render :show, status: :created, location: @character_value }
      else
        @character_category = CharacterCategory.first
        format.html { render :new, character_id: @character.id }
        format.json { render json: @character_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_values/1
  # PATCH/PUT /character_values/1.json
  def update
    @character = @character_value.character
    respond_to do |format|
      if @character_value.update(character_value_params)
        format.html do
          redirect_to polymorphic_path([@character, :character_values]),
                      notice: 'Character value was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @character_value }
      else
        @character_category = CharacterCategory.first
        format.html { render :edit, character_id: @character.id }
        format.json { render json: @character_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_values/1
  # DELETE /character_values/1.json
  def destroy
    @character = @character_value.character
    @character_value.destroy
    respond_to do |format|
      format.html do
        redirect_to polymorphic_url([@character, :character_values]),
                    notice: 'Character value was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character_value
    @character_value = CharacterValue.find(params[:id])
  end

  def set_character
    @character = Character.find(params[:character_id])
  end

  # Only allow a list of trusted parameters through.
  def character_value_params
    params.require(:character_value).permit(:character_id, :character_attribute_id, :value)
  end
end
