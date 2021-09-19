class PartitionsController < ApplicationController
  before_action :set_partition, only: %i[show edit update destroy]
  before_action :set_chapter, only: %i[index new create show edit update destroy]

  # GET /partitions
  # GET /partitions.json
  def index
    @partitions = Partition.all
  end

  # GET /partitions/1
  # GET /partitions/1.json
  def show
    @chapter = @chapter
  end

  # GET /partitions/new
  def new
    @partition = Partition.new
    @partition.chapter = @chapter
  end

  # GET /partitions/1/edit
  def edit; end

  # POST /partitions
  # POST /partitions.json
  def create
    @partition = Partition.new(partition_params)

    respond_to do |format|
      if @partition.save
        format.html do
          redirect_to chapter_partition_url(@chapter, @partition), notice: 'Partition was successfully created.'
        end
        format.json { render :show, status: :created, location: @partition }
      else
        format.html { render :new }
        format.json { render json: @partition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partitions/1
  # PATCH/PUT /partitions/1.json
  def update
    respond_to do |format|
      if @partition.update(partition_params)
        format.html do
          redirect_to chapter_partition_url(@chapter, @partition), notice: 'Partition was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @partition }
      else
        format.html { render :edit }
        format.json { render json: @partition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partitions/1
  # DELETE /partitions/1.json
  def destroy
    @partition.destroy
    respond_to do |format|
      format.html { redirect_to chapter_partitions_url(@chapter), notice: 'Partition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_partition
    @partition = Partition.find(params[:id])
  end

  def set_chapter
    @chapter = Chapter.find(params[:chapter_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def partition_params
    params.require(:partition).permit(:name, :body, :chapter_id)
  end
end
