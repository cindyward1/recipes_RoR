class AddTimestampsToTables < ActiveRecord::Migration
  def change
    add_column :ingredients, :created_at, :datetime
    add_column :ingredients, :updated_at, :datetime
    add_column :ingredients_recipes, :created_at, :datetime
    add_column :ingredients_recipes, :updated_at, :datetime
    add_column :instructions, :created_at, :datetime
    add_column :instructions, :updated_at, :datetime
    add_column :instructions_recipes, :created_at, :datetime
    add_column :instructions_recipes, :updated_at, :datetime
  end
end
