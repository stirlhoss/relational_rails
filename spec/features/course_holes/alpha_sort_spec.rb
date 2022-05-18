require 'rails_helper'

RSpec.describe 'CourseHoles#AlphaSort' do
  describe 'alphabetical sort of children' do
    before :each do
      @course1 = Course.create!(name: 'Bradley Park',
                                permanent: true,
                                par: 3,
                                difficulty: 3,
                                created_at: '2022-05-10 22:08:37.423105')
      @hole1 = Hole.create!(name: 'Hole 1',
                            distance_to_pin: 330,
                            par: 3,
                            permanent: true,
                            course_id: @course1.id)
      @hole2 = Hole.create!(name: 'Hole 2',
                            distance_to_pin: 370,
                            par: 4,
                            permanent: false,
                            course_id: @course1.id)
      @hole3 = Hole.create!(name: 'Over the Resevoir',
                            distance_to_pin: 520,
                            par: 4,
                            permanent: false,
                            course_id: @course1.id)
      @hole4 = Hole.create!(name: 'Can I make it?',
                            distance_to_pin: 520,
                            par: 4,
                            permanent: false,
                            course_id: @course1.id)
    end
    it 'provides a link that lets reloads the course/holes page with the children sorted' do
      visit "/courses/#{@course1.id}/holes"

      expect(page).to have_link('Sort Alphabetically')
    end

    it 'sorts the children alphabetically when the link is clicked' do
      visit "/courses/#{@course1.id}/holes"
      expect(@hole1.name).to appear_before(@hole4.name)

      click_link('Sort Alphabetically')

      expect(@hole4.name).to appear_before(@hole1.name)
    end

  end
end
