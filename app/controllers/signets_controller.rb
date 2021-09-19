class SignetsController < ApplicationController
  before_action :set_signet, only: %i[show edit update destroy]
  before_action :set_sigged, only: %i[index new create show edit update]

  # GET /signets
  # GET /signets.json
  def index
    @signets = (@sigged.nil? ? [] : @sigged.signets)
  end

  # GET /signets/1
  # GET /signets/1.json
  def show; end

  # GET /signets/new
  def new
    @signet = Signet.new
    @signet.sigged = @sigged
  end

  # GET /signets/1/edit
  def edit; end

  # POST /signets
  # POST /signets.json
  def create
    @signet = Signet.new(signet_params)

    respond_to do |format|
      if @signet.save
        format.html { redirect_to polymorphic_path([@sigged, @signet]), notice: 'Signet was successfully created.' }
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
    respond_to do |format|
      if @signet.update(signet_params)
        format.html { redirect_to polymorphic_path([@sigged, @signet]), notice: 'Signet was successfully updated.' }
        format.json { render :show, status: :ok, location: @signet }
      else
        format.html { render :edit, "#{@sigged.class.name.underscore}_id".to_sym => @sigged.id }
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
      format.html do
        redirect_to polymorphic_url([@sigged, :signets]), notice: 'Signet was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_signet
    @signet = Signet.find(params[:id])
  end

  def set_sigged
    klass = [Chapter, HoloceneEvent, Section, Book].detect { |c| params["#{c.name.underscore}_id"] }
    @sigged = (klass.nil? ? nil : klass.find(params["#{klass.name.underscore}_id"]))
  end

  # Only allow a list of trusted parameters through.
  def signet_params
    params.require(:signet).permit(:color, :message, :sigged_type, :sigged_id)
  end
end
