require 'rails_helper'

describe 'items' do
  it "can return all items" do
    item_list = create_list(:item, 3)
    get '/api/v1/items'

    expect(response).to have_http_status(200)

    items = JSON.parse(response.body)

    expect(items).to be_an(Array)
    expect(items.count).to eq(3)
    expect(items.first["id"]).to eq(item_list.first.id)
    expect(items.first["name"]).to eq(item_list.first.name)
    expect(items.first["description"]).to eq(item_list.first.description)
    expect(items.first["image_url"]).to eq(item_list.first.image_url)
  end

  it "can return one item" do
    item_one = create(:item)
    
    get "/api/v1/items/#{item_one.id}"
    
    expect(response).to have_http_status(200)
  
    item = JSON.parse(response.body)
  
    expect(item).to be_a(Hash)
    expect(item["id"]).to eq(item_one.id)
    expect(item["name"]).to eq(item_one.name)
    expect(item["description"]).to eq(item_one.description)
    expect(item["image_url"]).to eq(item_one.image_url)
  end
  
  it "can create new destination" do
    post "/api/v1/items?name=yoyo&description=swiiiing&image_url=https://www.yo-yo.com/resize/Shared/Images/Product/Teenage-Mutant-Ninja-Turtles-ProYo-Yo-Yo/Duncan_Teenage_Mutant_Ninja_Turtles_ProYo_Yo-Yo_3290NT-OR1-a.png"
  
    expect(response).to have_http_status(201)
  
    item = JSON.parse(response.body)
  
    expect(item).to be_a(Hash)
    expect(item["name"]).to eq("yoyo")
    expect(item["description"]).to eq("swiiiing")
    expect(item["image_url"]).to eq("https://www.yo-yo.com/resize/Shared/Images/Product/Teenage-Mutant-Ninja-Turtles-ProYo-Yo-Yo/Duncan_Teenage_Mutant_Ninja_Turtles_ProYo_Yo-Yo_3290NT-OR1-a.png")
  end
  
  it "can delete exisiting item" do
    create(:item)
    delete "/api/v1/items/#{Item.last.id}"
  
    expect(response).to have_http_status(204)
  
    expect(Item.count).to eq(0)
  end
end