require 'rails_helper'

feature "as a user, I should be able to search for best buy stores" do
  scenario "by zipcode" do
    visit "/"
    fill_in :search_box, with: "80202"
    click_on "Search"
    
    expect(current_path).to eq("/search")
    expect(page).to have_content("16 Total Stores")
    expect(page).to have_selector(".best_buy_store", count: 10)
    within first(".best_buy_store") do
      expect(page).to have_selector(".best_buy_store_long_name")
      expect(page).to have_selector(".best_buy_store_city")
      expect(page).to have_selector(".best_buy_store_distance")
      expect(page).to have_selector(".best_buy_store_phone")
      expect(page).to have_selector(".best_buy_store_type")
    end
  end
end