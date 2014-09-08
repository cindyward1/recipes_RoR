class Tag < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  validates :tag_text, :presence => true, :uniqueness => true,
            length: { minimum: 8, maximum: 16 }
end
