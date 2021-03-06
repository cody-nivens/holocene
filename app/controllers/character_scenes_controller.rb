class CharacterScenesController < ApplicationController
  before_action :set_character_scene, only: [:show, :edit, :update, :destroy]
  before_action :set_scene, only: [:edit, :update, :destroy]

  # GET /character_scenes/1
  # GET /character_scenes/1.json
  def show
    @scene = @character_scene.scene
  end

  # GET /character_scenes/1/edit
  def edit
  end

  # PATCH/PUT /character_scenes/1
  # PATCH/PUT /character_scenes/1.json
  def update
    respond_to do |format|
      if @character_scene.update(character_scene_params)
        format.html { redirect_to polymorphic_path([@character_scene.scene.situated, @character_scene.scene.key_point]), notice: 'Character scene was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_scene }
      else
        format.html { render :edit }
        format.json { render json: @character_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_scenes/1
  # DELETE /character_scenes/1.json
  def destroy
    @character_scene.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_url([@scene,:characters]), notice: 'Character scene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_scene
      @character_scene = CharacterScene.find(params[:id])
    end

    def set_scene
      @scene = Scene.find(params[:scene_id])
    end

    # Only allow a list of trusted parameters through.
    def character_scene_params
      params.require(:character_scene).permit(:character_id, :scene_id, :summary)
    end
end
