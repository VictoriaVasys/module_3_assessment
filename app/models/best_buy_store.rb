class BestBuyStore
  
  def initialize(raw_store = {})
    @_attrs = raw_store
  end
  
  def self.find_by_zip(zip)
    bb = BestBuyStoreService.new
    stores = bb.find_by_zip(zip)
    stores.map do |store|
      BestBuyStore.new(store)
    end
  end
  
  def self.total_stores(zip)
    bb = BestBuyStoreService.new
    bb.total_stores_by_zip(zip)
  end
  
  def long_name
    attrs[:longName]
  end
  
  def city
    attrs[:city]
  end
  
  def distance
    attrs[:distance]
  end
  
  def phone
    attrs[:phone]
  end
  
  def type
    attrs[:storeType]
  end
  
  private
  
    attr_reader :_attrs
    alias_method :attrs, :_attrs
  
end