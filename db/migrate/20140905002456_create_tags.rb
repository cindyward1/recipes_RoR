class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_text
      t.timestamps
    end

    create_join_table :recipes, :tags do |t|
      t.index :recipe_id
      t.index :tag_id
      t.timestamps
    end
  end
end
