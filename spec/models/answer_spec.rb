describe Answer do
  it { should belong_to :answerable }
  it { should belong_to :user}
  it { should validate_presence_of :an_answer }
end
