class RemoveUserIdFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :user_id
  end
end
