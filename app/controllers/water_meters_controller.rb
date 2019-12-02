class WaterMetersController < ApplicationController
  def index
    @water_meters = WaterMeter.all
    @months = %w[Январь Февраль 3 4 5 6 7 8 9 10 11 12]
  end

  def new
    @water_meter = WaterMeter.new
  end

  def create
    @water_meter = WaterMeter.create!(
        params.fetch(key :water_meter).
            permit(:cold, :hot, :check_date)
    )

    redirect_to '/'
  end

  def show

  end
end