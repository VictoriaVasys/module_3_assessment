require 'rails_helper'

describe BestBuyStore do
  it "finds real stores" do
    raw_store = 
      {
        "storeId": 2740,
        "storeType": "Mobile SAS",
        "longName": "BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER",
        "phone": "303-270-9189",
        "city": "DENVER",
        "distance": 3.45
      }

    best_buy_store = BestBuyStore.new(raw_store)

    expect(best_buy_store.long_name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
    expect(best_buy_store.city).to eq("DENVER")
    expect(best_buy_store.distance).to eq(3.45)
    expect(best_buy_store.phone).to eq("303-270-9189")
    expect(best_buy_store.type).to eq("Mobile SAS")
  end
  
  context ".find_by_zip(zip)" do
    it "finds stores based on zip code" do
      VCR.use_cassette('bb_store', record: :new_episodes) do
        best_buy_stores = BestBuyStore.find_by_zip(80202)
        best_buy_store = best_buy_stores.first
        
        expect(best_buy_stores).to be_an(Array)
        expect(best_buy_stores.count).to eq(10)
        expect(best_buy_store.long_name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      end
    end
  end
end
