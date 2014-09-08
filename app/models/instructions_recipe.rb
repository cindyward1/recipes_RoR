class InstructionsRecipe < ActiveRecord::Base
  scope :find_by_recipe, -> (recipe_id) { where("recipe_id = ?") }
  belongs_to :recipe
  belongs_to :instruction
end
