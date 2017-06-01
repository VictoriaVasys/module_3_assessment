class SearchController < ApplicationController
  
  def index
    @zip = params[:search_box]
    @best_buy_stores = BestBuyStore.find_by_zip(params[:search_box])
  end
  
end