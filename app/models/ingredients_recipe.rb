class IngredientsRecipe < ActiveRecord::Base
  scope :find_by_recipe, -> (recipe_id) { IngredientsRecipe.find_by(:recipe_id => recipe_id) }
  belongs_to :recipe
  belongs_to :ingredient
  validates :quantity, :presence => true, :numericality => true
end
