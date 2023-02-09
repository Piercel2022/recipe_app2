class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipefoods, dependent: :destroy

  has_many :foods, through: :recipefoods

  validates :name, presence: true, length: { minimus: 3, maximum: 250 }
end
