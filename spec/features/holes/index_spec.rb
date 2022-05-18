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

  describe 'only show permanent holes' do
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
      @hole3 = Hole.create!(name: 'Hole 3',
                            distance_to_pin: 380,
                            par: 5,
                            permanent: false,
                            course_id: @course1.id)
      @hole4 = Hole.create!(name: 'Hole 4',
                            distance_to_pin: 390,
                            par: 6,
                            permanent: true,
                            course_id: @course1.id)
    end
    it 'shows the information for permanent holse by default' do
      visit '/holes'

      expect(page).to have_content(@hole1.name)
      expect(page).to have_content(@hole1.distance_to_pin)
      expect(page).to have_content(@hole1.par)
      expect(page).to have_content(@hole1.permanent)

      expect(page).to have_content(@hole2.name)
      expect(page).to have_content(@hole2.distance_to_pin)
      expect(page).to have_content(@hole2.par)
      expect(page).to have_content(@hole2.permanent)

      expect(page).to have_content(@hole4.name)
      expect(page).to have_content(@hole4.distance_to_pin)
      expect(page).to have_content(@hole4.par)
      expect(page).to have_content(@hole4.permanent)
    end

    it 'does not display holes that are not permanent' do
      visit '/holes'

      expect(page).to_not have_content(@hole3.name)
      expect(page).to_not have_content(@hole3.distance_to_pin)
      expect(page).to_not have_content(@hole3.par)
      expect(page).to_not have_content(@hole3.permanent)
    end

    it 'has a link to edit the hole on each hole in the index view' do
      visit '/holes'

      expect(page).to have_link('Edit Hole')
    end
  end
end
