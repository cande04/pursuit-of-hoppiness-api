class BeerSerializer < ActiveModel::Serializer
  attributes :id, :name, :style, :abv, :description, :brewery, :brewery_location, :rating, :review
end
