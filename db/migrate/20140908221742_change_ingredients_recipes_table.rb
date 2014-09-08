class ChangeIngredientsRecipesTable < ActiveRecord::Migration
  def change
    drop_join_table :ingredients, :recipes

    create_table :ingredients_recipes do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.integer :quantity
    end
  end
end
