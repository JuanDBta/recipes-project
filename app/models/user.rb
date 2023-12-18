class User < ApplicationRecord
  has_many :food
  has_many :recipes
end
