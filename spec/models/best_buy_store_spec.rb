require 'rails_helper'

describe BestBuyStore do
  xit "finds real stores" do
    raw_store = 
        {
          "storeId": 2387,
          "storeType": "Mobile SAS",
          "longName": "BEST BUY MOBILE - RICHFIELD",
          "phone": "612-866-0957",
          "city": "RICHFIELD",
          "distance": 0.63
        }

    best_buy_store = BestBuyStore.new(raw_store)

    expect(best_buy_store.long_name).to eq("BEST BUY MOBILE - RICHFIELD")
    expect(best_buy_store.city).to eq("RICHFIELD")
    expect(best_buy_store.distance).to eq(0.63)
    expect(best_buy_store.phone).to eq("612-866-0957")
    expect(best_buy_store.type).to eq("Mobile SAS")
  end
  
  context ".find_by_zip(zip)" do
    it "finds stores based on zip code" do
      best_buy_stores = BestBuyStore.find_by_zip(80202)
      best_buy_store = best_buy_stores.first
      
      expect(best_buy_stores).to be_an(Array)
      expect(best_buy_stores.count).to eq(10)
      expect(best_buy_store.long_name).to eq("BEST BUY MOBILE - RICHFIELD")
    end
  end
end
