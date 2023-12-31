class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods
end
