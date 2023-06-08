class ActorsController < ApplicationController
  before_action :set_actor, only: %i[ show edit update destroy ]
  before_action :set_book, only: %i[index new]


  # GET /actors or /actors.json
  def index
    @actors = Actor.where(book_id: @book.id).order(:name)
    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: Actor.new, objects: @actorss } }
    end
  end

  # GET /actors/1 or /actors/1.json
  def show
    @book = @actor.book
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @actor } }
    end
  end

  # GET /actors/new
  def new
    @actor = Actor.new
    @actor.book = @book
  end

  # GET /actors/1/edit
  def edit
    @book = @actor.book
  end

  # POST /actors or /actors.json
  def create
    @actor = Actor.new(actor_params)
    @book = @actor.book

    respond_to do |format|
      if @actor.save
#        format.html { redirect_to actor_url(@actor), notice: "Actor was successfully created." }
        format.json { render :show, status: :created, location: @actor }
        format.turbo_stream {  flash.now[:notice] = "Actor was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actors/1 or /actors/1.json
  def update
    @book = @actor.book
    respond_to do |format|
      if @actor.update(actor_params)
#        format.html { redirect_to actor_url(@actor), notice: "Actor was successfully updated." }
        format.json { render :show, status: :ok, location: @actor }
        flash.now[:notice] = "Actor was successfully updated."
        format.turbo_stream { render "shared/show", locals: { object: @actor } }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actors/1 or /actors/1.json
  def destroy
    @book = @actor.book
    @actor.destroy

    respond_to do |format|
#      format.html { redirect_to book_actors_url(@book), notice: "Actor was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream { flash.now[:notice] = "Actor was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Only allow a list of trusted parameters through.
    def actor_params
      params.require(:actor).permit(:name, :book_id, :desc)
    end
end
