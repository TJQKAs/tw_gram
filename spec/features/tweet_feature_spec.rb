
require 'rails_helper'

feature 'tweets' do




  context 'tweets have been added' do
    before { Tweet.create message: 'My first tweet' }

    scenario 'display tweets' do
      visit '/tweets'
      expect(page).to have_content 'My first tweet'
      expect(page).not_to have_content 'You have no tweets yet'
    end
  end

  context 'adding tweets' do
    scenario 'prompts user to fill out form, then displays the new post' do
      user = build :user
      sign_up(user)
      visit '/tweets'
      fill_in 'Message', with: 'My first tweet'
      click_button 'Create Tweet'
      expect(page).to have_content 'My first tweet'
    end
  end

  context 'deleting tweets' do
    before do
     @user = create :user
     @user.tweets.create message: 'My first tweet'
    end


    scenario 'user can delete a tweet' do
      sign_in(@user)
      visit '/tweets'
      click_link 'delete tweet'
      expect(page).to have_content 'Tweet deleted successfully'
      expect(page).not_to have_link 'delete tweet'
    end
  end


end
