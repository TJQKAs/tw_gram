
require 'rails_helper'

feature 'tweets' do


  context 'no tweets should have been added' do
    scenario 'should display prompt to add a tweet' do
      visit '/tweets'
      expect(page).to have_content 'You have no tweets yet'
      expect(page).to have_link 'Add a tweet'
    end
  end



  context 'tweets have been added' do
    before { Tweet.create description: 'My first tweet' }

    scenario 'display tweets' do
      visit '/tweets'
      expect(page).to have_content 'My first tweet'
      expect(page).not_to have_content 'You have no tweets yet'
    end
  end


end
