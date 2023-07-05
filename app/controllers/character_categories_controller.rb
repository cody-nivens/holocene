class CharacterCategoriesController < ApplicationController
  before_action :set_character_category, only: %i[show edit update]

  # GET /character_categories
  # GET /character_categories.json
  def index
    @character_categories = CharacterCategory.order(:position)

    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: CharacterCategory.new, objects: @character_categorys } }
    end
  end

  def sort
    if request.xhr?
    @character_category = CharacterCategory.find(params[:character_category_id])
      @character_category.set_list_position(params[:character_category][:position].to_i)
      @character_category.save
      render body: nil
    else
      @character_categories = CharacterCategory.all.order(:position)
      respond_to do |format|
        format.turbo_stream { render "shared/sort", locals: { link_object: nil, object: CharacterCategory.new, objects: @character_categories } }
      end
    end
  end


  # GET /character_categories/1
  # GET /character_categories/1.json
  def show
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @character_category } }
    end
  end

  # GET /character_categories/new
  def new
    @character_category = CharacterCategory.new
  end

  # GET /character_categories/1/edit
  def edit
    @short = params[:short]
  end

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
    @short = params[:short]
    @character_categories = CharacterCategory.order(:position)
    respond_to do |format|
      if @character_category.update(character_category_params)
#        format.html { redirect_to @character_category, notice: 'Character category was successfully updated.' }
        format.json { render :show, status: :ok, character_category: @character_category }
        flash.now[:notice] = "Character Category was successfully updated."
        format.turbo_stream { render "shared/update", locals: { object: @character_category, short: @short } }
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
