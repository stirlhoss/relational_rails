require 'rails_helper'

RSpec.describe 'Holes#Edit' do
  it 'links to the holes edit page' do
    course1 = Course.create!(name: 'Bradley Park',
                            permanent: true,
                            par: 3,
                            difficulty: 3)
    hole1 = Hole.create!(name: 'Hole 1',
                          distance_to_pin: 330,
                          par: 3,
                          permanent: true,
                          course_id: course1.id)
    hole2 = Hole.create!(name: 'Hole 2',
                          distance_to_pin: 370,
                          par: 4,
                          permanent: true,
                          course_id: course1.id)

    visit "/holes/#{hole1.id}"

    click_link("Edit Hole")

    expect(current_path).to eq("/holes/#{hole1.id}/edit")
  end

  it 'can edit and update the hole' do
    course1 = Course.create!(name: 'Bradley Park',
                            permanent: true,
                            par: 3,
                            difficulty: 3)
    hole1 = Hole.create!(name: 'Hole 1',
                          distance_to_pin: 330,
                          par: 3,
                          permanent: true,
                          course_id: course1.id)
    hole2 = Hole.create!(name: 'Hole 2',
                          distance_to_pin: 370,
                          par: 4,
                          permanent: true,
                          course_id: course1.id)

    visit "/holes/#{hole1.id}/edit"

    fill_in( 'Name', with: 'testing this')
    fill_in( 'Par', with: 4)
    fill_in( 'Distance to pin', with: 400)
    fill_in( 'Permanent', with: true)

    click_button("Update Hole")

    expect(current_path).to eq("/holes/#{hole1.id}")
    expect(page).to have_content("testing this")
    expect(page).to have_content("4")
    expect(page).to have_content("400")
    expect(page).to have_content("true")
  end
end
