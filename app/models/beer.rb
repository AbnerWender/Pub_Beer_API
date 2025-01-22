class Beer < ApplicationRecord
    has_many :food_pairings
    has_many :beers_pubs
    has_many :pubs, through: :beers_pubs
end
