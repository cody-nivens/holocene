class MetricsController < ApplicationController
  before_action :set_metric, only: %i[ show ]

  # GET /metrics or /metrics.json
  def index
    @metrics = Metric.all
  end

  # GET /metrics/1 or /metrics/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metric
      @metric = Metric.find(params[:id])
    end
end
