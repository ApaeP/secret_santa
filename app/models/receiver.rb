class Receiver < ApplicationRecord
  belongs_to :draw
  belongs_to :participant
  has_one :gifter
end
