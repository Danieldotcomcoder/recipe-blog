class Food < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 50 }
  validates :measurementUnit, presence: true
  validates :Price, presence: true

  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :inventory_foods
  has_many :recipes, through: :recipe_foods, dependent: :destroy
end
