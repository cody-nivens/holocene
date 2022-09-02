class CharacterScenesController < ApplicationController
  before_action :set_character_scene, only: %i[show edit update]

  def show
  end

  # GET /character_scenes/1/edit
  def edit
    @scene = @character_scene.scene
  end

  # PATCH/PUT /character_scenes/1
  # PATCH/PUT /character_scenes/1.json
  def update
    @scene = @character_scene.scene
    respond_to do |format|
      if @character_scene.update(character_scene_params)
        format.html do
          redirect_to scene_path(@character_scene.scene), notice: 'Character scene was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @character_scene }
      else
        format.html { render :edit }
        format.json { render json: @character_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character_scene
    @character_scene = CharacterScene.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def character_scene_params
    params.require(:character_scene).permit(:character_id, :scene_id, :summary)
  end
end
