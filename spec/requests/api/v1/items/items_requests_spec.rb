require 'rails_helper'

describe 'items' do
  it "can return all items" do
    item_list = create_list(:item, 3)
    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items).to be_an(Array)
    expect(items.count).to eq(3)
    expect(items.first["id"]).to eq(item_list.first.id)
    expect(items.first["name"]).to eq(item_list.first.name)
    expect(items.first["description"]).to eq(item_list.first.description)
    expect(items.first["image_url"]).to eq(item_list.first.image_url)
  end

  
end