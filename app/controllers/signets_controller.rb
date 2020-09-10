class SignetsController < ApplicationController
  before_action :set_signet, only: [:show, :edit, :update, :destroy]

  # GET /signets
  # GET /signets.json
  def index
    @sigged = find_siggable
    @signets = (@sigged.nil? ? [] : @sigged.signets)
  end

  # GET /signets/1
  # GET /signets/1.json
  def show
    @sigged = @signet.sigged
  end

  # GET /signets/new
  def new
    @signet = Signet.new
    @sigged = find_siggable
    @signet.sigged = @sigged
  end

  # GET /signets/1/edit
  def edit
    @sigged = @signet.sigged
  end

  # POST /signets
  # POST /signets.json
  def create
    @signet = Signet.new(signet_params)
    @sigged = @signet.sigged

    respond_to do |format|
      if @signet.save
        format.html { redirect_to @signet, notice: 'Signet was successfully created.' }
        format.json { render :show, status: :created, location: @signet }
      else
        format.html { render :new }
        format.json { render json: @signet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signets/1
  # PATCH/PUT /signets/1.json
  def update
    @sigged = @signet.sigged
    respond_to do |format|
      if @signet.update(signet_params)
        format.html { redirect_to @signet, notice: 'Signet was successfully updated.' }
        format.json { render :show, status: :ok, location: @signet }
      else
        format.html { render :edit, sigged_type: @signet.sigged_type, sigged_id: @signet.sigged_id }
        format.json { render json: @signet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signets/1
  # DELETE /signets/1.json
  def destroy
    @sigged = @signet.sigged
    @signet.destroy
    respond_to do |format|
      format.html { 
        if @sigged.class.name == "Chapter"
        redirect_to chapter_signets_url(@sigged), notice: 'Signet was successfully destroyed.' 
        elsif @sigged.class.name == "Section"
        redirect_to section_signets_url(@sigged), notice: 'Signet was successfully destroyed.' 
        elsif @sigged.class.name == "Book"
        redirect_to book_signets_url(@sigged), notice: 'Signet was successfully destroyed.' 
        end
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signet
      @signet = Signet.find(params[:id])
    end

    def find_siggable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end

    # Only allow a list of trusted parameters through.
    def signet_params
      params.require(:signet).permit(:color, :message, :sigged_type, :sigged_id)
    end
end
