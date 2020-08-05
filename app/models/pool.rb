class Pool < ApplicationRecord
  belongs_to :user

  has_many :draws, dependent: :destroy
  has_many :participants, dependent: :destroy
end
