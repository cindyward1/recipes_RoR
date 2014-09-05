class Instruction < ActiveRecord::Base
  has_many :instructions_recipes
  has_many :recipes, through: :instructions_recipes
  validates :step_number, :presence => true, :uniqueness => true
  validates :step_description, :presence => true
end
