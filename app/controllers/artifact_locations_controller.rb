class ArtifactLocationsController < ApplicationController
  before_action :set_artifact_location, only: %i[ show edit update destroy ]


  # GET /artifact_locations or /artifact_locations.json
  def index
    @artifact_locations = ArtifactLocation.all
  end

  # GET /artifact_locations/1 or /artifact_locations/1.json
  def show
  end

  # GET /artifact_locations/new
  def new
    @artifact_location = ArtifactLocation.new
  end

  # GET /artifact_locations/1/edit
  def edit
  end

  # POST /artifact_locations or /artifact_locations.json
  def create
    @artifact_location = ArtifactLocation.new(artifact_location_params)

    respond_to do |format|
      if @artifact_location.save
        format.html { redirect_to @artifact_location, notice: "Artifact location was successfully created." }
        format.json { render :show, status: :created, location: @artifact_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artifact_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artifact_locations/1 or /artifact_locations/1.json
  def update
    respond_to do |format|
      if @artifact_location.update(artifact_location_params)
        format.html { redirect_to @artifact_location, notice: "Artifact location was successfully updated." }
        format.json { render :show, status: :ok, location: @artifact_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artifact_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artifact_locations/1 or /artifact_locations/1.json
  def destroy
    @artifact_location.destroy
    respond_to do |format|
      format.html { redirect_to artifact_locations_url, notice: "Artifact location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artifact_location
      @artifact_location = ArtifactLocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artifact_location_params
      params.require(:artifact_location).permit(:artifact_id, :located_id, :located_type)
    end
end
