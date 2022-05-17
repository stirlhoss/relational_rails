require 'rails_helper'

RSpec.describe 'Courses new' do
  describe 'courses#new' do
    it 'link to the new page from the courses index' do
      visit '/courses'
      click_link('New Course')

      expect(current_path).to eq('/courses/new')
    end

    it 'can create a new course' do
      visit '/courses/new'

      fill_in('Name', with: 'Northwoods')
      fill_in('Par', with: 5)
      fill_in('Difficulty', with: 5)
      fill_in('Permanent', with: 'true')
      click_button('Create Course')

      expect(current_path).to eq('/courses')
      expect(page).to have_content('Northwoods')
      expect(page).to have_content('Par: 5')
      expect(page).to have_content('Difficulty Rating (out of 5): 5')
      expect(page).to have_content('Permanent: true')
    end
  end
end
