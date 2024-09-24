class Api::V1::TradingsController < ApplicationController
  def index
    if params.dig(:date).present?
      date = Date.parse(params[:date])
      @tradings = Trading.where(time: date.all_day).order(:time)
      render json: @tradings
    end
  end

  def profit
    if params.dig(:date).present?
      date = Date.parse(params[:date])
      tradings = Trading.where(time: date.all_day).order(:value)
      @profit = 100 * (tradings.last.value - tradings.first.value)
      render json: @profit.round(2)

    end
  end
end
