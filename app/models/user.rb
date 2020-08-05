class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pools, dependent: :destroy
  has_many :draws, through: :pools, dependent: :destroy
  has_many :participants, through: :pools, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
