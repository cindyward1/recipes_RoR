class Cook < User
  has_many :recipes, through: :tried_recipes
end
