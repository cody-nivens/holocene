class ArtifactTypesController < ApplicationController
  before_action :set_artifact_type, only: %i[ show edit update destroy ]
  before_action :set_book, only: %i[ index new show edit update destroy ]


  # GET /artifact_types or /artifact_types.json
  def index
    @artifact_types = ArtifactType.where(book_id: @book.id).order(:name)
  end

  # GET /artifact_types/1 or /artifact_types/1.json
  def show
  end

  # GET /artifact_types/new
  def new
    @artifact_type = ArtifactType.new
    @artifact_type.book = @book
  end

  # GET /artifact_types/1/edit
  def edit
  end

  # POST /artifact_types or /artifact_types.json
  def create
    @artifact_type = ArtifactType.new(artifact_type_params)
    @book = @artifact_type.book

    respond_to do |format|
      if @artifact_type.save
        format.html { redirect_to book_artifact_type_url(@book,@artifact_type), notice: "Artifact type was successfully created." }
        format.json { render :show, status: :created, location: @artifact_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artifact_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artifact_types/1 or /artifact_types/1.json
  def update
    respond_to do |format|
      if @artifact_type.update(artifact_type_params)
        format.html { redirect_to book_artifact_type_url(@book,@artifact_type), notice: "Artifact type was successfully updated." }
        format.json { render :show, status: :ok, location: @artifact_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artifact_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artifact_types/1 or /artifact_types/1.json
  def destroy
    @artifact_type.destroy
    respond_to do |format|
      format.html { redirect_to book_artifact_types_url(@book), notice: "Artifact type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artifact_type
      @artifact_type = ArtifactType.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Only allow a list of trusted parameters through.
    def artifact_type_params
      params.require(:artifact_type).permit(:name, :book_id)
    end
end
