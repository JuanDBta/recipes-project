class Food < ApplicationRecord
  validates :name, :measurement_unit, :price, :quantity, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  
  belongs_to :user
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods
end
