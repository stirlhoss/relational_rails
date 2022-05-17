require 'rails_helper'

RSpec.describe 'courses#edit' do
  it 'links to the edit page' do
    course = Course.create(name: 'Megido', difficulty: 4, par: 4, permanent: true)

    visit '/courses'

    click_button "Edit #{course.name}"

    expect(current_path).to eq "/courses/#{course.id}/edit"
  end

  it 'can edit the course' do
    course = Course.create(name: 'Megggido', difficulty: 3, par: 1, permanent: true)

    visit '/courses'

    expect(page).to have_content('Megggido')
    expect(page).to have_content('Difficulty Rating (out of 5): 3')
    expect(page).to have_content('Par: 1')
    expect(page).to have_content('Permanent: true')

    click_button 'Edit Megggido'

    fill_in 'Name', with: 'Megido'
    fill_in 'Difficulty', with: 4
    fill_in 'Par', with: 4
    fill_in 'Permanent', with: true
    click_button 'Update Course'

    expect(current_path).to eq("/courses/#{course.id}")
    expect(page).to have_content('Megido')
    expect(page).to have_content('Difficulty Rating (out of 5): 4')
    expect(page).to have_content('Par: 4')
    expect(page).to have_content('Permanent: true')
  end
end
