class TriedRecipe < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :cook, foreign_key: :recipe_user_id
  validates :date_tried, :presence => true
end
