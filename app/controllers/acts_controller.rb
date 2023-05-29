class ActsController < ApplicationController
  before_action :set_act, only: %i[ show edit update destroy ]
  before_action :set_book, only: %i[index new]

  # GET /acts or /acts.json
  def index
    @acts = Act.where(book_id: @book).order(:name)
    respond_to do |format|
      format.turbo_stream { }
    end
  end

  # GET /acts/1 or /acts/1.json
  def show
    @locations = Location.where(book_id: @book.id)
    respond_to do |format|
      format.turbo_stream { }
    end
  end

  # GET /acts/new
  def new
    @act = Act.new
  end

  # GET /acts/1/edit
  def edit
  end

  # POST /acts or /acts.json
  def create
    @act = Act.new(act_params)
    @book = @act.book

    respond_to do |format|
      if @act.save
        @acts = @book.acts
#        format.html { redirect_to act_url(@act), notice: "Act was successfully created." }
        format.json { render :show, status: :created, location: @act }
        format.turbo_stream { flash.now[:notice] = "Act was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acts/1 or /acts/1.json
  def update
    respond_to do |format|
      if @act.update(act_params)
        @acts = @book.acts
         flash.now[:notice] = "Act was successfully updated."
#        format.html { redirect_to act_url(@act), notice: "Act was successfully updated." }
        format.json { render :show, status: :ok, location: @act }
        format.turbo_stream { render 'show' }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acts/1 or /acts/1.json
  def destroy
    @act.destroy
    @acts = @book.acts

    respond_to do |format|
#      format.html { redirect_to book_acts_url(@book), notice: "Act was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream { flash.now[:notice] = "Act was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_act
      @act = Act.find(params[:id])
      @book = @act.book
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Only allow a list of trusted parameters through.
    def act_params
      params.require(:act).permit(:name, :book_id, :desc)
    end
end
