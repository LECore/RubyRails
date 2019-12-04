require 'rails_helper'

RSpec.feature "WaterMeterPage", type: :feature do
  scenario "The visitor should see a header" do
    visit root_path
    #expect(page).to have_text("Показатели счетчиков воды")
    expect(page).to have_xpath("//h1", :text => "Показатели счетчиков воды")
  end

  scenario "The visitor should see a submit button" do
    visit root_path
    page.find(:css,'.btn-outline-primary', :text => "Отправить")
    #expect(page).to have_xpath("//button", :text => "Отправить")
  end
end
