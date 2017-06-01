class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @items = Item.all
  end
  
  private

  def item_params
    params.permit(:id, :name, :description, :image_url)
  end
  
end