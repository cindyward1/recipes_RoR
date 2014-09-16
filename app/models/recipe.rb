class Recipe < ActiveRecord::Base
  belongs_to :contributor, foreign_key: :recipe_user_id
  has_many :tried_recipes
  has_many :cooks, through: :tried_recipes
  has_and_belongs_to_many :tags
  validates :title, :presence => true, :uniqueness => true, length: { minimum: 8, maximum: 50 }
  validates :date_contributed, :presence => true

  def get_tags
    return_array = []
    self.tags.each do |tag|
      return_array << tag.id
    end
    return_array
  end

  def calculate_rating(new_rating)
    return_rating = (self.rating * self.number_ratings + new_rating)/(self.number_ratings + 1)
  end
end
