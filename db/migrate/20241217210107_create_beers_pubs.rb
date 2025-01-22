class CreateBeersPubs < ActiveRecord::Migration[6.0]
  def change
    create_table :beers_pubs do |t|
      t.references :beer, null: false, foreign_key: true
      t.references :pub, null: false, foreign_key: true

      t.timestamps
    end

    add_index [ :beer_id, :pub_id ], unique: true
  end
end
