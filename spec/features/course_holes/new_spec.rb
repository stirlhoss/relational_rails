require 'rails_helper'

RSpec.describe 'CourseHoles#New' do
  it 'links to the create new child page from course_holes index' do
    course = Course.create(name: 'Megido', difficulty: 4, par: 4, permanent: true)

    visit "/courses/#{course.id}/holes"

    click_link "Create Hole"

    expect(current_path).to eq "/courses/#{course.id}/holes/new"
  end

  it 'can create a new hole' do
    course = Course.create(name: 'Megido', difficulty: 4, par: 4, permanent: true)
    visit "/courses/#{course.id}/holes/new"

    fill_in('Name', with: 'this is a test hole')
    fill_in('Par', with: '5')
    fill_in('Distance to pin', with: 500)
    fill_in('Permanent', with: true)
    click_button('Create Hole')

    expect(current_path).to eq("/courses/#{course.id}/holes")

    expect(page).to have_content('this is a test hole')
    expect(page).to have_content('Par: 5')
    expect(page).to have_content('Distance to pin: 500')
    expect(page).to have_content('Permanent: true')
  end
end
