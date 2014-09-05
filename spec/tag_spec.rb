describe Tag do
  it { should have_and_belong_to_many :recipes }
  it { validates_presence_of :tag_text }
  it { validates_uniqueness_of :tag_text }
end
