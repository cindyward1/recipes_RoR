class Contributor < RecipeUser
  has_many :recipes, foreign_key: :recipe_user_id
end
