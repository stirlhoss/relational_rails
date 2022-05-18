require 'rails_helper'

RSpec.describe 'Holes#Destroy' do
  it 'can delete a hole from the index page' do
    course = Course.create(name: 'Megido', difficulty: 4, par: 4, permanent: true)
    hole = Hole.create(name: 'Over the Creek', distance_to_pin: 350, par: 4, permanent: true, course_id: course.id)
    visit '/holes'
    click_button 'Delete'
    expect(current_path).to eq('/holes')
    expect(page).to_not have_content('Over the Creek')
  end
end
