require "spec_helper"

describe Cook do
  it { should have_many :recipes, through: :tried_recipes }
  it { should validate_presence_of :user_name }
  it { should ensure_length_of(:user_name).is_at_most(16) }
  it { should validate_presence_of :user_password }
  it { should ensure_length_of(:user_password).is_at_most(16) }
  it { should validate_presence_of :screen_name }
  it { should ensure_length_of(:screen_name).is_at_most(50) }
  it { should validate_presence_of :date_joined }
end
