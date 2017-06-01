require 'rails_helper'

feature "as a user, I should be able to search for best buy stores" do
  scenario "by zipcode" do
    # As a user
    # When I visit "/"
    visit "/"
    # And I fill in a search box with "80202" and click "search"
    fill_in :search_box, with: "80202"
    click_on "Search"
    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq("/search")
    # And I should see stores within 25 miles of 80202
    # And I should see a message that says "16 Total Stores"
    expect(page).to have_content("16 Total Stores")
    # And I should see exactly 10 results
    expect(page).to have_selector(".best_buy_store", count: 10)
    # And I should see the long name, city, distance, phone number and store type for each of the 10 results
    within first(".best_buy_store") do
      expect(page).to have_selector(".best_buy_store_long_name")
      expect(page).to have_selector(".best_buy_store_city")
      expect(page).to have_selector(".best_buy_store_distance")
      expect(page).to have_selector(".best_buy_store_phone")
      expect(page).to have_selector(".best_buy_store_type")
    end
  
  
  
  #   destination = create(:destination)
  #   
  #   visit "/"
  #   click_on "Show", match: :first
  #   
  #   expect(current_path).to eq(destination_path(destination))
  #   expect(page).to have_content destination.name
  #   expect(page).to have_content destination.zip
  #   expect(page).to have_content destination.description
  #   
  #   expect(page).to have_selector(".weather", count: 10)
  #     within first(".weather") do
  #      expect(page).to have_content("Date: ")
  #      expect(page).to have_content("High Temp: ")
  #      expect(page).to have_content("Low Temp: ")
  #      expect(page).to have_content("Conditions: ")
  #     end
  #   
  end
end