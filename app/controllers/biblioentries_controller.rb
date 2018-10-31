class BiblioentriesController < ApplicationController
  before_action :set_biblioentry, only: [:show, :edit, :update, :destroy]

  # GET /biblioentries
  # GET /biblioentries.json
  def index
    @biblioentries = Biblioentry.all
  end

  # GET /biblioentries/1
  # GET /biblioentries/1.json
  def show
  end

  # GET /biblioentries/new
  def new
    @biblioentry = Biblioentry.new
  end

  # GET /biblioentries/1/edit
  def edit
  end

  # POST /biblioentries
  # POST /biblioentries.json
  def create
    @biblioentry = Biblioentry.new(biblioentry_params)

    respond_to do |format|
      if @biblioentry.save
        format.html { redirect_to @biblioentry, notice: 'Biblioentry was successfully created.' }
        format.json { render :show, status: :created, location: @biblioentry }
      else
        format.html { render :new }
        format.json { render json: @biblioentry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /biblioentries/1
  # PATCH/PUT /biblioentries/1.json
  def update
    respond_to do |format|
      if @biblioentry.update(biblioentry_params)
        format.html { redirect_to @biblioentry, notice: 'Biblioentry was successfully updated.' }
        format.json { render :show, status: :ok, location: @biblioentry }
      else
        format.html { render :edit }
        format.json { render json: @biblioentry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biblioentries/1
  # DELETE /biblioentries/1.json
  def destroy
    @biblioentry.destroy
    respond_to do |format|
      format.html { redirect_to biblioentries_url, notice: 'Biblioentry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biblioentry
      @biblioentry = Biblioentry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def biblioentry_params
      params.require(:biblioentry).permit(:name, :xreflabel, :copyright_year, :copyright_holder, :publisher)
    end
end
