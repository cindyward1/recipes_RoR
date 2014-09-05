describe Ingredient do
  it { should have_many :ingredients_recipes }
  it { should have_many :recipes }
  it { should validate_presence_of :unit_of_measure }
  it { should validate_presence_of :ingredient_name }
end
