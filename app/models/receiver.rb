class Receiver < ApplicationRecord
  belongs_to :draw
  belongs_to :participant
  belongs_to :gifter, optional: true
end
