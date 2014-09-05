class Recipe < ActiveRecord::Base
  belongs_to :contributor, foreign_key: :user_id
  has_many :tried_recipes
  has_many :cooks, through: :tried_recipes
  has_and_belongs_to_many :tags
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_instructions
  has_many :instructions, through: :recipe_instructions
  validates :date_contributed, :presence => true
end
