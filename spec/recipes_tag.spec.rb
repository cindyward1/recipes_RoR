describe RecipesTag do
  it { should belong_to :recipe }
  it { should belong_to :tags }
end
