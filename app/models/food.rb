class Food < ApplicationRecord
  # Association
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods


  # Validation
  validates :name, presence: true, length: { minimum: 3, maximum: 250 }
  validates :measurement_unit, presence: true, length: { maximum: 250 }
  validates :price, presence: true
  validates :quantity, presence: true
end
