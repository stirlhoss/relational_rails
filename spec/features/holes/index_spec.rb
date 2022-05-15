require 'rails_helper'

RSpec.describe 'holes index page', type: :feature do
  before :each do
    @course1 = Course.create!(name: 'Bradley Park',
                              permanent: true,
                              par: 3,
                              difficulty: 3)
    @hole1 = Hole.create!(name: 'Hole 1',
                          distance_to_pin: 330,
                          par: 3,
                          permanent: true,
                          course_id: @course1.id)
    @hole2 = Hole.create!(name: 'Hole 2',
                          distance_to_pin: 370,
                          par: 4,
                          permanent: true,
                          course_id: @course1.id)
  end
  it 'can see all holes in the database' do
    visit '/holes'
    save_and_open_page

    expect(page).to have_content(@hole1.name)
    expect(page).to have_content(@hole1.distance_to_pin)
    expect(page).to have_content(@hole1.par)
    expect(page).to have_content(@hole1.permanent)
  end

  it 'has a link to courses index at the top of each page' do
    visit '/holes'
    expect(page).to have_link('Holes')

    visit '/courses'
    expect(page).to have_link('Holes')
  end
end
