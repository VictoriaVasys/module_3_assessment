class BestBuyStoreService
  
  def initialize
    @best_buy_key = ENV['BEST_BUY_KEY']
    @conn = Faraday.new("https://api.bestbuy.com")
  end
  
  def find_by_zip(zip)
    results = conn.get("/v1/stores(area(#{zip},25))?format=json&show=storeId,storeType,longName,phone,city,distance&pageSize=10&apiKey=#{best_buy_key}")
    JSON.parse(results.body, symbolize_names: :true)
  end
  
  private
  
  attr_reader :conn, :best_buy_key
  
end
