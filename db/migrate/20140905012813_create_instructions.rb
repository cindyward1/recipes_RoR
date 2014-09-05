class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.integer :step_number
      t.string :step_description
    end

    create_join_table :instructions, :recipes do |t|
      t.index :recipe_id
      t.index :instruction_id
    end
  end
end
