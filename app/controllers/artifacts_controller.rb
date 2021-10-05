class ArtifactsController < ApplicationController
  before_action :set_artifact, only: %i[show edit update destroy]
  before_action :set_book, only: %i[tagged index new]

  # GET /artifacts or /artifacts.json
  def index
    @artifacts = Artifact.where(book_id: @book.id).joins(:artifact_type).joins(:character).order('artifact_types.name, artifacts.name')
  end

  # GET /artifacts/1 or /artifacts/1.json
  def show
    @book = @artifact.book
  end

  def tagged
    @artifacts = if params[:tag].present?
                   Artifact.tagged_with(params[:tag])
                 else
                   Artifact.all
                 end
  end

  # GET /artifacts/new
  def new
    @artifact = Artifact.new
    @artifact.book = @book
  end

  # GET /artifacts/1/edit
  def edit
    @book = @artifact.book
  end

  # POST /artifacts or /artifacts.json
  def create
    @artifact = Artifact.new(artifact_params)
    @book = @artifact.book

    respond_to do |format|
      if @artifact.save
        format.html { redirect_to artifact_path(@artifact), notice: 'Artifact was successfully created.' }
        format.json { render :show, status: :created, location: @artifact }
      else
        format.html { render :new, book_id: @book.id, status: :unprocessable_entity }
        format.json { render json: @artifact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artifacts/1 or /artifacts/1.json
  def update
    @book = @artifact.book
    respond_to do |format|
      if @artifact.update(artifact_params)
        format.html { redirect_to artifact_path(@artifact), notice: 'Artifact was successfully updated.' }
        format.json { render :show, status: :ok, location: @artifact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artifact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artifacts/1 or /artifacts/1.json
  def destroy
    @book = @artifact.book
    @artifact.destroy
    respond_to do |format|
      format.html { redirect_to book_artifacts_path(@book), notice: 'Artifact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_artifact
    @artifact = Artifact.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  # Only allow a list of trusted parameters through.
  def artifact_params
    params.require(:artifact).permit(:name, :character_id, :book_id, :artifact_type_id, :summary, :parent_id,
                                     :tag_list)
  end
end
