class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.string :abv
      t.string :description
      t.string :brewery
      t.string :brewery_location
      t.integer :rating
      t.string :review
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
