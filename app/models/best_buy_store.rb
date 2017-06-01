class BestBuyStore
  
  def initialize(raw_store = {})
    @attrs = raw_store
  end
  
  def self.find_by_zip(zip)
    bb = BestBuyStoreService.new
    bb.find_by_zip(zip)
  end
  
  def self.total_stores(zip)
    bb = BestBuyStoreService.new
    bb.total_stores_by_zip(zip)
  end
  
  def long_name
    attrs[:longName]
  end
  
  def long_name
    attrs[:longName]
  end
  
  private
  
  attr_reader :attrs
  
end