class ScenesController < ApplicationController
  before_action :set_scene, only: [:show, :edit, :update, :destroy]
  before_action :set_book, only: [:index, :new, :create ]

  # GET /scenes
  # GET /scenes.json
  def index
    @grid = ScenesGrid.new(grid_params) do |scope|
       scope.page(params[:page])
    end
  end

  # GET /scenes/1
  # GET /scenes/1.json
  def show
    @book = @scene.book
  end

  # GET /scenes/new
  def new
    @scene = Scene.new
    @scene.book = @book
  end

  # GET /scenes/1/edit
  def edit
    @book = @scene.book
  end

  # POST /scenes
  # POST /scenes.json
  def create
    @scene = Scene.new(scene_params)

    respond_to do |format|
      if @scene.save
        format.html { redirect_to book_scene_path(:book_id => @book.id, :id => @scene.id), notice: 'Scene was successfully created.' }
        format.json { render :show, status: :created, location: @scene }
      else
        format.html { render :new }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scenes/1
  # PATCH/PUT /scenes/1.json
  def update
    @book = @scene.book
    respond_to do |format|
      if @scene.update(scene_params)
        format.html { redirect_to book_scene_path(:book_id => @book.id, :id => @scene.id), notice: 'Scene was successfully updated.' }
        format.json { render :show, status: :ok, location: @scene }
      else
        format.html { render :edit }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenes/1
  # DELETE /scenes/1.json
  def destroy
    @book = @scene.book
    @scene.destroy
    respond_to do |format|
      format.html { redirect_to book_scenes_url(:book_id => @book.id), notice: 'Scene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    protected

  def grid_params
    params.fetch(:scenes_grid, {:order => :abc, :descending => false}).permit!
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene
      @scene = Scene.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Only allow a list of trusted parameters through.
    def scene_params
      params.require(:scene).permit(:abc, :check, :summary, :place, :time, :scene_sequel, :goal_reaction, :conflict_dilemma, :disaster_decision, :short_term_goal, :long_term_goal, :over_arching_goal, :book_id)
    end
end
