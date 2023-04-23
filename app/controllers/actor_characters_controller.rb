class ActorCharactersController < ApplicationController
  before_action :set_actor_character, only: %i[ show edit update destroy ]
  before_action :set_actor, only: %i[index new]

  def index
    @actor_characters = ActorCharacter.where(actor_id: @actor.id)
  end

  # GET /actor_characters/new
  def new
    @actor_character = ActorCharacter.new
    @actor_character.actor = @actor
  end

  # GET /actor_characters/1/edit
  def edit
  end

  # POST /actor_characters or /actor_characters.json
  def create
    @actor_character = ActorCharacter.new(actor_character_params)
    @actor = @actor_character.actor

    respond_to do |format|
      if @actor_character.save
        format.html { redirect_to actor_actor_characters_url(@actor), notice: "Actor character was successfully created." }
        format.json { render :show, status: :created, location: @actor_character }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @actor_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actor_characters/1 or /actor_characters/1.json
  def update
    respond_to do |format|
      if @actor_character.update(actor_character_params)
        format.html { redirect_to actor_actor_characters_url(@actor), notice: "Actor character was successfully updated." }
        format.json { render :show, status: :ok, location: @actor_character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @actor_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actor_characters/1 or /actor_characters/1.json
  def destroy
    @actor_character.destroy

    respond_to do |format|
      format.html { redirect_to actor_actor_characters_url(@actor), notice: "Actor character was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor_character
      @actor_character = ActorCharacter.find(params[:id])
      @actor = @actor_character.actor
    end

    def set_actor
      @actor = Actor.find(params[:actor_id])
    end

    # Only allow a list of trusted parameters through.
    def actor_character_params
      params.require(:actor_character).permit(:actor_id, :character_id)
    end
end
