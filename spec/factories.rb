FactoryGirl.define do
  
  factory :item do
    name Faker::Commerce.product_name
    description Faker::Lorem.paragraph
    sequence :image_url do |n| 
      "http://robohash.org/#{n}.png?set=set2&bgset=bg1&size=200x200"
    end
  end
  
end