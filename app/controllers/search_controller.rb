class SearchController < ApplicationController
  
  def index
    @zip = zip
    @total_stores = BestBuyStore.total_stores(zip)
    @best_buy_stores = BestBuyStore.find_by_zip(zip)
  end
  
  private
  
  def zip
    params[:search_box]
  end
  
end