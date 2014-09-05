class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :unit_of_measure
      t.string :ingredient_name
    end

    create_join_table :ingredients, :recipes do |t|
      t.index :recipe_id
      t.index :ingredient_id
      t.integer :quantity
    end
  end
end
