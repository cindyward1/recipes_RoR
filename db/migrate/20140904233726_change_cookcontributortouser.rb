class ChangeCookcontributortouser < ActiveRecord::Migration
  def change
    remove_column :recipes, :contributor_id
    add_column :recipes, :user_id, :integer

    remove_column :tried_recipes, :cook_id
    add_column :tried_recipes, :user_id, :integer
  end
end
