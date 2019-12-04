# frozen_string_literal: true

Rails.application.routes.draw do
  # get '/', to: 'water_meters#index'
  root 'water_meters#index'
  resources :water_meters
end
