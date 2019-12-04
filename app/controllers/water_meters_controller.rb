# frozen_string_literal: true

class WaterMetersController < ApplicationController # rubocop:disable Style/Documentation
  def index
    @water_meters = WaterMeter.all
    @months = %w[Январь Февраль 3 4 5 6 7 8 9 10 11 12]
  end

  def new
    @water_meter = WaterMeter.new
  end

  def create
    @water_meter = WaterMeter.create!(
      params.fetch(:water_meter).permit(:cold, :hot, :check_date)
    )

    redirect_to '/'
  end

  def show
    @water_meter = WaterMeter.find(params[:id])
  end

  def destroy
    @water_meter = WaterMeter.find(params[:id])
    @water_meter.destroy!

    redirect_to '/'
  end
end
