# frozen_string_literal: true

class BeersPub < ApplicationRecord
  belongs_to :beer
  belongs_to :pub
end
