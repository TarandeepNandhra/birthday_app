require "capybara/rspec"
require_relative "../../app"

Capybara.app = Birthday

feature "serve web app" do
  scenario "should serve home page" do
    visit("/")
    fill_in :name, with: 'Taran'
    fill_in :day, with: '5'
    click_button('Submit')
    expect(page).to have_content "Happy Birthday Taran"
    expect(page).to have_content "5"
  end
end
