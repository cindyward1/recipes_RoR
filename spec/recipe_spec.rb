describe Recipe do
  it { should belong_to :contributor }
  it { should have_many :tried_recipes }
  it { should have_many :cooks }
  it { should have_and_belong_to_many :tags }
  it { should have_many :ingredients_recipes }
  it { should have_many :ingredients }
  it { should have_many :instructions_recipes }
  it { should have_many :instructions }
  it { should validate_presence_of :date_contributed }
end
