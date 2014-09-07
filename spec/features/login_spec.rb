require 'capybara/rails'

describe "the signin process" do
  it "signs a user in who uses the right password" do
    visit '/login'
    user = User.create(:name => 'Joe', :password => 'password')
    fill_in 'Name', :with => 'Joe'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    expect(page).to have_content 'Logged in!'
  end

  it "gives a user an error who uses the wrong password" do
    visit '/sessions/new'
    user = User.create(:name => 'Joe', :password => 'password')
    fill_in 'Name', :with => 'Joe'
    fill_in 'Password', :with => 'wrong'
    click_button 'Log in'
    expect(page).to have_content 'invalid'
  end

  it "gives a user an error if the name is already taken" do
    visit '/signup'
    user = User.create(:name => 'Joe', :password => 'password')
    another_user = User.create(:name => 'Joe', :password => 'blamblam')
    fill_in 'Name', :with => 'Joe'
    fill_in 'Password', :with => 'blamblam'
    click_button 'Create User'
    expect(page).to have_content 'Name has already been taken'
  end

  it 'reroutes a user to the questions index' do
    visit '/login'
    user = User.create(:name => 'Joe', :password => 'password')
    fill_in 'Name', :with => 'Joe'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    expect(current_path).to eq root_path
  end
end
