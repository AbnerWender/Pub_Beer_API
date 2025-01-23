# frozen_string_literal: true

class Pub < ApplicationRecord
  has_many :beers_pubs, dependent: :destroy
  has_many :beers, through: :beers_pubs
end
