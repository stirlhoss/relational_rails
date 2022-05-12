require 'rails_helper'

RSpec.describe "Holes show page" do
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
  it 'can display a certain hole based on its id' do
    visit "/holes/#{@hole1.id}"
  end

end
