require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

    it "must be logged in to create Tweets" do
    visit('/')
    expect(page).not_to have_button('Create Tweet')
  end



  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end


feature "Once logged in on the website" do
   before do
      first_user = build :first_user
      sign_up(first_user)
  end

  it "can only edit tweets which they've created" do
      fill_in 'Message', with: 'Hello'
      click_button 'Create Tweet'
      click_link('Sign out')
      second_user = build :second_user
      sign_up(second_user)
      expect(page).not_to have_content('delete tweet')
  end
end
