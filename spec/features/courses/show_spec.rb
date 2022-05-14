require 'rails_helper'

RSpec.describe 'course show page ' do
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
    @hole2 = Hole.create!(name: 'Hole 2',
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

  it 'can display a certain course based on its id' do
    visit "/courses/#{@course1.id}"


    expect(page).to have_content(@course1.name)
    expect(page).to have_content(@course1.permanent)
    expect(page).to have_content(@course1.par)
    expect(page).to have_content(@course1.difficulty)
  end

  it 'dose not display information for other courses' do
    visit "/courses/#{@course1.id}"


    expect(page).to_not have_content(@course2.name)

    expect(page).to_not have_content(@course2.par)
    expect(page).to_not have_content(@course2.difficulty)
  end

  it 'displays a hole count for the course you are looking at' do
    visit "/courses/#{@course1.id}"

    expect(page).to have_content('Hole count: 2')
  end
end
