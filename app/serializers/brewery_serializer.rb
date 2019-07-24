class BrewerySerializer < ActiveModel::Serializer
  has_one :user
  attributes :id, :name, :location, :rating, :review, :image_url

  def editable
    scope == object.user
  end
end
