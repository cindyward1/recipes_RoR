class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :type
      t.string :user_name
      t.string :user_password
      t.string :screen_name
      t.date :date_joined
      t.timestamps
    end
  end
end
