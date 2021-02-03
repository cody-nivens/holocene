class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :set_object, only: [:index, :new, :add, :list, :edit, :show, :create, :update, :destroy ]

  # GET /characters
  # GET /characters.json
  def index
    if params[:race].nil?
      @characters = @object.characters
    elsif params[:race].blank?
      @characters = @object.characters.where("race = ''")
    else
      @characters = @object.characters.where("race = ?", params[:race])
    end
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/list
  def list
  end

  # GET /characters/1/add
  def add
    characters_avail = params[:characters_avail]
    characters_ids = params[:characters_ids]

    unless characters_avail.nil?
      characters_avail.each do |character_id|
        next if character_id.blank?
        character = Character.find(character_id)
        @object.characters << character unless @object.characters.include?(character)
        @object.book.characters << character if @object.class.name != 'Book' && @object.class.name != 'Scene' && !@object.book.characters.include?(character)
        @object.key_point.scripted.book.characters << character if @object.class.name == 'Scene' && !@object.key_point.scripted.book.characters.include?(character)
      end
    end

    unless characters_ids.nil?
      characters_ids.each do |character_id|
        next if character_id.blank?
        character = Character.find(character_id)
        @object.characters.destroy(character) if @object.characters.include?(character)
      end
    end

    respond_to do |format|
       format.html { redirect_to polymorphic_path([ @object, 'characters_list'])}
    end
  end

  # POST /characters
  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)

    respond_to do |format|
      if @character.save
        @object.characters << @character
        @object.key_point.scripted.book.characters << @character if @object.class.name == 'Scene' && !@object.key_point.scripted.book.characters.include?(@character)
        @object.key_point.scripted.characters << @character if @object.class.name == 'Scene' && !@object.key_point.scripted.characters.include?(@character)

        format.html { redirect_to polymorphic_path([@object, @character]), notice: 'Character was successfully created.' }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to polymorphic_path([@object, @character]), notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_url([@object, 'characters']), notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    def set_object
    klass = [Scene, Story, Book].detect{|c| params["#{c.name.underscore}_id"]}
    @object = klass.find(params["#{klass.name.underscore}_id"])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:name, :reason_for_name, :nickname, :reason_for_nickname, :race, :occupation_class, 
                                        :social_class, :first_name, :middle_name, :last_name, :suffix, :birth_year, :death_year,
                                       :age_at_son, :father_id, :honorific, :grouping, :use_honorific_only,:background)
    end
end
