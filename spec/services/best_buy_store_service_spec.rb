require 'rails_helper'

describe BestBuyStoreService do
  context ".find_by_zip(zip)" do
    it "returns raw best buy store information based on zip" do
      service = BestBuyStoreService.new
      best_buy_stores = service.find_by_zip(80202)

      expect(best_buy_stores).to be_an(Array)
      expect(best_buy_stores.count).to eq(10)
      # expect(best_buy_stores.first).to have_key(:date)
      # expect(best_buy_stores.first).to have_key(:high)
      # expect(best_buy_stores.first).to have_key(:low)
      # expect(best_buy_stores.first[:date][:weekday]).to be_a(String)
      # expect(best_buy_stores.first[:date][:monthname]).to be_a(String)
      # expect(best_buy_stores.first[:date][:day]).to be_an(Integer)
    end
  end
end