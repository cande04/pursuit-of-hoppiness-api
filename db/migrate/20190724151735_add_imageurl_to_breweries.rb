class AddImageurlToBreweries < ActiveRecord::Migration[5.2]
  def change
    add_column :breweries, :image_url, :string
  end
end
