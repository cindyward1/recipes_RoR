class Recipe < ActiveRecord::Base
  belongs_to :contributor, foreign_key: :recipe_user_id
  has_many :tried_recipes
  has_many :cooks, through: :tried_recipes
  has_and_belongs_to_many :tags
  has_many :ingredients_recipes, dependent: :destroy
  has_many :ingredients, through: :ingredients_recipes
  has_many :instructions_recipes, autosave: true, dependent: :destroy
  has_many :instructions, through: :instructions_recipes, dependent: :destroy
  validates :title, :presence => true, :uniqueness => true, length: { minimum: 8, maximum: 50 }
  validates :date_contributed, :presence => true

  def get_tags
    return_array = []
    self.tags.each do |tag|
      return_array << tag.id
    end
    return_array
  end
end
