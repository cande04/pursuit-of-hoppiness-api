class CreateBreweries < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :location
      t.integer :rating
      t.string :review

      t.timestamps
    end
  end
end
