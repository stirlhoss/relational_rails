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
  end

  it 'can display a certain course based on its id' do
    visit "/courses/#{@course1.id}"

    save_and_open_page

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
end
