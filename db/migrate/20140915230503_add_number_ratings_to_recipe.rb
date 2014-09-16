class AddNumberRatingsToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :number_ratings, :integer
  end
end
