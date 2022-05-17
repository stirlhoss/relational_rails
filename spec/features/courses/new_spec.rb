require 'rails_helper'
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

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

      new_course_id = Course.last.id
      expect(current_path).to eq("/courses/#{new_course_id}")
      expect(page).to have_content('Northwoods')
      expect(page).to have_content('Par: 5')
      expect(page).to have_content('Difficulty Rating: 5')
      expect(page).to have_content('Permanent: true')
    end
  end

end
