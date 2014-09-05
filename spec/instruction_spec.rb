describe Instruction do
  it { should have_many :instructions_recipes }
  it { should have_many :recipes }
  it { should validate_presence_of :step_number }
  it { should validate_uniqueness_of :step_number }
  it { should validate_presence_of :step_description }
end
