class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  # validations
  validates :quantity, presence: true
end
