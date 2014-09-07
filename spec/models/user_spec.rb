describe User do
  it { should have_many :questions }
  it { should have_many(:answers).through(:questions)}
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name}
  it { should have_secure_password }
end
