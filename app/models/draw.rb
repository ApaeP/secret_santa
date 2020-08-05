class Draw < ApplicationRecord
  belongs_to :pool

  has_many :gifters, dependent: :destroy
  has_many :receivers, dependent: :destroy
end
