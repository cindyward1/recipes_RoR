class CreateTriedRecipes < ActiveRecord::Migration
  def change
    create_table :tried_recipes do |t|
      t.integer :cook_id
      t.integer :recipe_id
      t.date :date_tried
      t.timestamps
    end
  end
end
