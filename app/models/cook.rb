class Cook < RecipeUser
  has_many :tried_recipes, foreign_key: :recipe_user_id
  has_many :recipes, through: :tried_recipes
end
