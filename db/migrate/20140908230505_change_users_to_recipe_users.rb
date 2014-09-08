class ChangeUsersToRecipeUsers < ActiveRecord::Migration
  def change
    drop_table :users

    create_table :recipe_users do |t|
      t.string :user_name
      t.string :user_password
      t.string :screen_name
      t.date :date_joined
      t.timestamps
    end
  end
end
