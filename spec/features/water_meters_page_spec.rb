# frozen_string_literal: true

require 'rails_helper'

# RSpec.feature 'WaterMeterPage', type: :feature do
#   scenario 'The visitor should see a header' do
#     visit root_path
#     # expect(page).to have_text("Показатели счетчиков воды")
#     expect(page).to have_xpath('//h1', text: 'Показатели счетчиков воды')
#   end
#
#   scenario 'The visitor should see a submit button' do
#     visit root_path
#     page.find(:css, '.btn-outline-primary', text: 'Отправить')
#     # expect(page).to have_xpath("//button", :text => "Отправить")
#   end
# end

describe 'Water meters page', type: :system do
  before { driven_by :selenium, using: :chrome }
  before { visit '/' }

  it 'have a right title' do
    expect(page).to have_text('Water Meters')
  end

  describe 'Check table' do
    before 'fill table' do

      (1..12).each do |i|
        fill_in 'Cold', with: i+1*2
        fill_in 'Hot',  with: i*10
        if i != 1
          fill_in 'Date', with: "01.#{i}.2019"
        else fill_in 'Date', with: "01.0#{i}.2019"
        end

        # sleep 1
        click_button 'Send'
      end
      sleep 3
    end

    it 'have a right table data' do
      (1..12).each do |i|
        expect(page).to have_text i+1*2
        expect(page).to have_text i*10
      end
    end
  end
end
