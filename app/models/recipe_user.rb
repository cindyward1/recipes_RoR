class RecipeUser < ActiveRecord::Base
  self.inheritance_column = 'object_type'

  validates :user_name, :presence => true, :uniqueness => true,
            length: { minimum: 8, maximum: 16 }
  validates :user_password, :presence => true, length: { minimum: 8, maximum: 16 }
  validates :screen_name, :presence => true, length: { maximum: 50 }
  validates :date_joined, :presence => true

  scope :contributors, -> { where(type: 'Contributor') }
  scope :cooks, -> { where(type: 'Cook') }

  def check_screen_name
    if self.screen_name == ""
      self.screen_name = self.user_name
    end
  end

end
