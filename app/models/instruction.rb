class Instruction < ActiveRecord::Base
  scope :find_by_recipe, (recipe_id) -> { InstructionsRecipe.instructions.find_by(:recipe_id => recipe_id) }
  has_many :instructions_recipes
  has_many :recipes, through: :instructions_recipes
  validates :step_number, :presence => true, :uniqueness => true
  validates :step_description, :presence => true
end
