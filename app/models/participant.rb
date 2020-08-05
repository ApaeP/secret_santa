class Participant < ApplicationRecord
  belongs_to :pool
  has_many :gifters
  has_many :receivers

  validates :first_name, presence: true
  validates :last_name, presence: true
end
