class Cook < User
  has_many :tried_recipes, foreign_key: :user_id
  has_many :recipes, through: :tried_recipes
end
