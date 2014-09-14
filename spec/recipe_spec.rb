describe Recipe do
  it { should belong_to :contributor }
  it { should have_many :tried_recipes }
  it { should have_many :cooks }
  it { should have_and_belong_to_many :tags }
  it { should have_many :ingredients_recipes }
  it { should have_many :ingredients }
  it { should have_many :instructions_recipes }
  it { should have_many :instructions }
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }
  it { should ensure_length_of(:title).is_at_least(8) }
  it { should ensure_length_of(:title).is_at_most(50) }
  it { should validate_presence_of :date_contributed }
end
