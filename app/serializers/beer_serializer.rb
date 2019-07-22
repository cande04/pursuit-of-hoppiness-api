class BeerSerializer < ActiveModel::Serializer
  has_one :user
  attributes :id, :name, :style, :abv, :description, :brewery, :brewery_location, :rating, :review

  def editable
    scope == object.user
  end
end
