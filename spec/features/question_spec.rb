describe "Questions" do


    it "adds answer when user clicks 'add answer' button" , js: true do
      visit '/login'
      question = Question.create(:a_question => 'How?')
      user = User.create(:name => 'Joe', :password => 'password')
      fill_in 'Name', :with => 'Joe'
      fill_in 'Password', :with => 'password'
      click_on 'Log in'
      visit root_path
      click_link 'How?'
      visit "/questions/#{question.id}"
      fill_in 'answer_an_answer', :with => 'test answer'
      click_button "add answer"
      expect(page).to have_content "test answer"
    end

    it "reply to an answer entered by another user" , js: true do
      visit '/login'
      question = Question.create(:a_question => 'How?', :id => 1)
      user = User.create(:name => 'Joe', :password => 'password')
      fill_in 'Name', :with => 'Joe'
      fill_in 'Password', :with => 'password'
      click_on 'Log in'
      visit root_path
      click_link 'How?'
      visit "/questions/#{question.id}"
      fill_in 'answer_an_answer', :with => 'test answer'
      click_button "add answer"
      #save_and_open_page
      click_link "new_new_reply"
      fill_in 'answer_an_answer', :with => 'test answer'
      click_button "Create Answer"
      expect(page).to have_content "test answer"
    end

    it "allows the creator of the question to edit question" do
      visit '/users/login'
      user = User.create(:name => 'Joe', :password => 'password')
      fill_in 'Name', :with => 'Joe'
      fill_in 'Password', :with => 'password'
      click_button 'Log in'
      question = user.questions.create(a_question: 'test question')
      visit "/questions/"
      #save_and_open_page
      click_link "Edit"
      fill_in 'question_a_question', :with => 'test question2'
      click_on 'Update Question'
      expect(page).to have_content "test question2"
  end

    it "allows the creator of the question to delete question" do
      visit '/users/login'
      user = User.create(:name => 'Joe', :password => 'password')
      fill_in 'Name', :with => 'Joe'
      fill_in 'Password', :with => 'password'
      click_button 'Log in'
      question = user.questions.create(a_question: 'test question')
      visit "/questions/#{question.id}"
      click_link "Delete"
      visit "/questions/"
      expect(page).to_not have_content "test question"
    end

end
