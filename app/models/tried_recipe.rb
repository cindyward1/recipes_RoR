class TriedRecipe < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :cook, foreign_key: :user_id
  validates :date_tried, :presence => true
end
