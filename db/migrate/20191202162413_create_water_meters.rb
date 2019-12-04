# frozen_string_literal: true

class CreateWaterMeters < ActiveRecord::Migration[6.0]
  def change
    create_table :water_meters do |t|
      t.date :check_date
      t.float :hot
      t.float :cold
    end
  end
end
