require 'rails_helper'

describe BestBuyStoreService do
  context ".find_by_zip(zip)" do
    it "returns raw best buy store information based on zip" do
      service = BestBuyStoreService.new
      best_buy_stores = service.find_by_zip(80202)

      expect(best_buy_stores).to be_an(Array)
      expect(best_buy_stores.count).to eq(10)
      expect(best_buy_stores.first).to have_key(:storeType)
      expect(best_buy_stores.first).to have_key(:longName)
      expect(best_buy_stores.first).to have_key(:phone)
      expect(best_buy_stores.first).to have_key(:city)
      expect(best_buy_stores.first).to have_key(:distance)
      # expect(best_buy_stores.first[:date][:weekday]).to be_a(String)
      # expect(best_buy_stores.first[:date][:monthname]).to be_a(String)
      # expect(best_buy_stores.first[:date][:day]).to be_an(Integer)
    end
  end
  
  context ".total_stores_by_zip(zip)" do
    it "returns the total number of stores within 25 miles of the zip" do
      service = BestBuyStoreService.new
      total_stores = service.total_stores_by_zip(80202)

      expect(total_stores).to be_an(Integer)
      expect(total_stores).to eq(16)
    end
  end
end