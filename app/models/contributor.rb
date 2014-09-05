class Contributor < User
  has_many :recipes, foreign_key: :user_id
end
