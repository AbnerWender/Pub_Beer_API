class Pub < ApplicationRecord
    has_many :beers_pubs
    has_many :beers, through: :beers_pubs
end
