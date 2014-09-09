describe Tag do
  it { should have_and_belong_to_many :recipes }
  it { should validate_presence_of :tag_text }
  it { should validate_uniqueness_of :tag_text }
  it { should ensure_length_of(:tag_text).is_at_least(4) }
  it { should ensure_length_of(:tag_text).is_at_most(16) }
end
