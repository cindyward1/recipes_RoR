class ChangeRatingToReal < ActiveRecord::Migration
  def change
    remove_column :recipes, :rating
    add_column :recipes, :rating, :real
  end
end
