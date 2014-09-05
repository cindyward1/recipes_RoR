class Ingredient < ActiveRecord::Base
  has_many :ingredients_recipes
  has_many :recipes, through: :ingredients_recipes
  validates :unit_of_measure, :presence => true
  validates :ingredient_name, :presence => true
end
