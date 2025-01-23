# frozen_string_literal: true

class Beer < ApplicationRecord
  has_many :food_pairings, dependent: :destroy
  has_many :beers_pubs, dependent: :destroy
  has_many :pubs, through: :beers_pubs
end
