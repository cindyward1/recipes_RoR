class IngredientsRecipe < ActiveRecord::Base
  scope :find_by_recipe, -> (recipe_id) { where("recipe_id = ?") }
  belongs_to :recipe
  belongs_to :ingredient
  validates :quantity, :presence => true, :numericality => true
end
