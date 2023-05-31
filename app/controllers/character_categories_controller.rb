class CharacterCategoriesController < ApplicationController
  before_action :set_character_category, only: %i[show edit update]

  # GET /character_categories
  # GET /character_categories.json
  def index
    @character_categories = CharacterCategory.order(:position)

    respond_to do |format|
      format.turbo_stream { }
    end
  end

  def sort
    # @list = List.find(params[:list_id])
    @character_category = CharacterCategory.find(params[:character_category_id])
    @character_category.update(character_category_params)
    render body: nil
  end

  # GET /character_categories/1
  # GET /character_categories/1.json
  def show
    respond_to do |format|
      format.turbo_stream { }
    end
  end

  # GET /character_categories/new
  def new
    @character_category = CharacterCategory.new
  end

  # GET /character_categories/1/edit
  def edit; end

  # POST /character_categories
  # POST /character_categories.json
  def create
    @character_category = CharacterCategory.new(character_category_params)

    respond_to do |format|
      if @character_category.save
        @character_categories = CharacterCategory.order(:position)
#        format.html { redirect_to @character_category, notice: 'Character category was successfully created.' }
        format.json { render :show, status: :created, character_category: @character_category }
        format.turbo_stream { flash.now[:notice] = "Character Category was successfully created." }
      else
        format.html { render :new }
        format.json { render json: @character_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_categories/1
  # PATCH/PUT /character_categories/1.json
  def update
    @character_categories = CharacterCategory.order(:position)
    respond_to do |format|
      if @character_category.update(character_category_params)
#        format.html { redirect_to @character_category, notice: 'Character category was successfully updated.' }
        format.json { render :show, status: :ok, character_category: @character_category }
        format.turbo_stream { flash.now[:notice] = "Character Category was successfully updated." }
      else
        format.html { render :edit }
        format.json { render json: @character_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_categories/1
  # DELETE /character_categories/1.json
  def destroy
    @character_category = CharacterCategory.includes([{ character_attributes: :character_values }]).find(params[:id])
    @character_category.destroy
    @character_categories = CharacterCategory.order(:position)

    respond_to do |format|
#      format.html { redirect_to character_categories_url, notice: 'Character category was successfully destroyed.' }
      format.json { head :no_content }
      format.turbo_stream { flash.now[:notice] = "Character Category was successfully destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character_category
    @character_category = CharacterCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def character_category_params
    params.require(:character_category).permit(:name, :position)
  end
end
