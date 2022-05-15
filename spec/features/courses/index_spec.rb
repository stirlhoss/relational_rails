require 'rails_helper'

RSpec.describe 'courses index page', type: :feature do
  before :each do
    @course1 = Course.create!(name: 'Bradley Park',
                            permanent: true,
                            par: 3,
                            difficulty: 3,
                            created_at: "2022-05-10 22:08:37.423105" )
    @course2 = Course.create!(name: 'Eureka',
                             permanent: true,
                             par: 4,
                             difficulty: 5,
                             created_at: "2022-05-11 22:08:37.423105" )
    @course3 = Course.create!(name: 'Washington',
                             permanent: true,
                             par: 2,
                             difficulty: 1,
                             created_at: "2022-05-18 22:08:37.423105" )
  end
  it 'can see all courses in the database' do

    visit '/courses'

    expect(page).to have_content(@course1.name)
    expect(page).to have_content(@course2.name)
  end

  it 'orders the courses by the time they were created and display time of creation' do
    visit '/courses'

    expect(@course3.name).to appear_before(@course1.name)
    expect(@course3.name).to appear_before(@course2.name)
    expect(@course2.name).to appear_before(@course1.name)
    expect(page).to have_content(@course1.created_at)
    expect(page).to have_content(@course2.created_at)
    expect(page).to have_content(@course3.created_at)
  end

  it 'has a link to courses index at the top of each page' do
    visit '/holes'
    expect(page).to have_link('Courses')

    visit '/courses'
    expect(page).to have_link('Courses')
  end
end
