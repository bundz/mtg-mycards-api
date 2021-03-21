class Card < ApplicationRecord
  belongs_to :edition

  scope :red, -> { where("color like '%R%'") }
  scope :white, -> { where("color like '%W%'") }
  scope :sorcery, -> { where(card_type: 'Sorcery') }
  scope :boros, -> { red.white }
end
