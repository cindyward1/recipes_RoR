class AddRecipeUserIdToTriedRecipes < ActiveRecord::Migration
  def change
    add_column :tried_recipes, :recipe_user_id, :integer
  end
end
