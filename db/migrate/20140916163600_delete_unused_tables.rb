class DeleteUnusedTables < ActiveRecord::Migration
  def change
    drop_table :ingredients
    drop_table :ingredients_recipes
    drop_table :instructions
    drop_join_table :instructions, :recipes
  end
end
