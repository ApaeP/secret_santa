class Gifter < ApplicationRecord
  belongs_to :draw
  belongs_to :participant
  has_one :receiver
end
