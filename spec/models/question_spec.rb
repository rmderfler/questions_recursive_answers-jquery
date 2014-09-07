describe Question do
  it { should have_many :answers }
  it { should belong_to :user}
  it { should validate_presence_of :a_question }
end
