require 'rails_helper'

RSpec.describe 'Course Holes Index', type: :feature do
  before :each do
    @course1 = Course.create!(name: 'Bradley Park',
                              permanent: true,
                              par: 3,
                              difficulty: 3)
    @course2 = Course.create!(name: 'Eureka',
                              permanent: true,
                              par: 4,
                              difficulty: 5)
    @hole1 = Hole.create!(name: 'Hole 1',
                          distance_to_pin: 330,
                          par: 3,
                          permanent: true,
                          course_id: @course1.id)
    @hole2 = Hole.create!(name: 'A different Hole 2',
                          distance_to_pin: 370,
                          par: 4,
                          permanent: true,
                          course_id: @course1.id)
    @hole3 = Hole.create!(name: 'Over the Resevoir',
                          distance_to_pin: 520,
                          par: 4,
                          permanent: true,
                          course_id: @course2.id)
  end
  it 'can see all children that are related to 1 parent' do
    visit "/courses/#{@course1.id}/holes"

    expect(page).to have_content(@hole1.name)
    expect(page).to have_content(@hole1.permanent)
    expect(page).to have_content(@hole1.par)
    expect(page).to have_content(@hole1.distance_to_pin)

    expect(page).to_not have_content(@hole3.name)
  end

  it 'has links to the child table at the top of the page' do
    visit "/courses/#{@course1.id}"

    expect(page).to have_link("Holes at this course")

    click_link("Holes at this course")

    expect(current_path).to eq "/courses/#{@course1.id}/holes"
  end
end
