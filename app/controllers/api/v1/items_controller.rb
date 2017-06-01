class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @items = Item.all
  end
  
  def show
    begin
      @item = Item.find(params[:id])
    rescue
      render file: "public/404.html",  status: 404
    end
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      render :show, status: 201
    else
      render file: "public/422.html",  status: 422
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      render json: {message: "Item successfully removed"}, status: 204
    else
      render file: "public/422.html",  status: 422
    end
  end
  
  private

  def item_params
    params.permit(:id, :name, :description, :image_url)
  end
  
end