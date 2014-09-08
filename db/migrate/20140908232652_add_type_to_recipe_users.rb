class AddTypeToRecipeUsers < ActiveRecord::Migration
  def change
    add_column :recipe_users, :type, :string
  end
end
