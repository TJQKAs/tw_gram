
require 'rails_helper'

feature 'tweets' do


  context 'no tweets should have been added' do
    scenario 'should display prompt to add a tweet' do
      visit '/tweets'
      expect(page).to have_content 'You have no tweets yet'
      expect(page).to have_link 'Add a tweet'
    end
  end
end
