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



RSpec.describe 'Water meters page', type: :system do
  before { driven_by :selenium, using: :chrome }
  before { visit '/' }

  it 'have a right title' do
    expect(page).to have_text('Показатели счетчиков воды')
  end

  describe 'Check table' do
    before 'fill table' do
      fill_in 'Дата', with: '01.12.2019'
      fill_in 'Холодная', with: '53452345'
      fill_in 'Горячая',  with: '12'

      click_button 'Отправить'
      sleep 5
    end

    it 'have a right table data' do
      expect(page).to have_xpath('//td', text: '53452345.0')
    end
  end
end


# describe 'Check table' do
#   let(:values) { [1,2,3] }
#
#   before 'fill table' do
#     fill_in 'Дата', with: "01.#{i = 0, i < 12  do
#
#     end}.2019"
#
#     12.times do |i|
#
#     end
#     fill_in 'Холодная', with: '53452345'
#     fill_in 'Горячая',  with: '12'
#
#     click_button 'Отправить'
#     sleep 5
#   end
#
#   it 'have a right table data' do
#     expect(page).to have_xpath('//td', text: '53452345.0')
#   end
# end