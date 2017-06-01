require 'rails_helper'

describe BestBuyStore do
  it "finds real stores" do
    raw_store = {
    
    }

    best_buy_store = BestBuyStore.new(raw_store)

    expect(station.long_name).to eq("BEST BUY MOBILE - RICHFIELD")
  end
end
