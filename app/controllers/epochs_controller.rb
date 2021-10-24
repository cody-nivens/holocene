class EpochsController < ApplicationController
  before_action :set_epoch, only: %i[geo_map show edit update destroy]

  # GET /epochs
  # GET /epochs.json
  def index
    @epochs = Epoch.order(:start_date).all
  end

  def geo_map
    @object = @epoch
  end

  # GET /epochs/1
  # GET /epochs/1.json
  def show
    @grid = HoloceneEventsGrid.new(hgrid_params.merge({ start_year: [@epoch.start_date, @epoch.end_date] })) do |scope|
              scope.includes([:region, :rich_text_body, :event_types]).page(params[:page])
    end
  end

  # GET /epochs/new
  def new
    @epoch = Epoch.new
    @epoch.user_id = current_user.id
  end

  # GET /epochs/1/edit
  def edit; end

  # POST /epochs
  # POST /epochs.json
  def create
    @epoch = Epoch.new(epoch_params)

    respond_to do |format|
      if @epoch.save
        format.html { redirect_to @epoch, notice: 'Epoch was successfully created.' }
        format.json { render :show, status: :created, location: @epoch }
      else
        format.html { render :new }
        format.json { render json: @epoch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /epochs/1
  # PATCH/PUT /epochs/1.json
  def update
    respond_to do |format|
      if @epoch.update(epoch_params)
        format.html { redirect_to @epoch, notice: 'Epoch was successfully updated.' }
        format.json { render :show, status: :ok, location: @epoch }
      else
        format.html { render :edit }
        format.json { render json: @epoch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /epochs/1
  # DELETE /epochs/1.json
  def destroy
    @epoch.destroy
    respond_to do |format|
      format.html { redirect_to epochs_url, notice: 'Epoch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def hgrid_params
    params.fetch(:holocene_events_grid, { order: :start_year, descending: false }).permit!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_epoch
    @epoch = Epoch.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def epoch_params
    params.require(:epoch).permit(:name, :start_date, :end_date, :user_id)
  end
end
