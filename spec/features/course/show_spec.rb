require 'rails_helper'

RSpec.describe 'course show page ' do
  before :each do
    @course1 = Course.create!(name: 'Bradley Park',
                            permanent: true,
                            par: 3,
                            difficulty: 3)
    @course2 = Course.create!(name: 'Eureka',
                             permanent: false,
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

end
