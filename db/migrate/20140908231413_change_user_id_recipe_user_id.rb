class ChangeUserIdRecipeUserId < ActiveRecord::Migration
  def change
    remove_column :recipes, :user_id
    add_column :recipes, :recipe_user_id, :integer
  end
end
