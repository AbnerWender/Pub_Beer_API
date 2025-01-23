# frozen_string_literal: true

class CreateBeers < ActiveRecord::Migration[8.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style

      t.timestamps
    end
  end
end
