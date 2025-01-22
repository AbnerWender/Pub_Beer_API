class CreateFoodPairings < ActiveRecord::Migration[6.0]
  def change
    create_table :food_pairings do |t|
      t.string :description
      t.references :beer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
