describe IngredientsRecipe do
  it { should belong_to :recipe }
  it { should belong_to :ingredient }
  it { should validate_presence_of :quantity }
  it { should validate_numericality_of :quantity }
end
