describe TriedRecipe do
  it { should belong_to :recipe }
  it { should belong_to :cook }
  it { should validate_presence_of :date_tried }
end
