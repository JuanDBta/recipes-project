class User < ApplicationRecord
  validates :name, presence: true

  has_many :food
  has_many :recipes
end
