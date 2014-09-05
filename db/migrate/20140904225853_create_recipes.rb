class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :rating
      t.date :date_contributed
      t.integer :contributor_id
      t.timestamps
    end
  end
end
