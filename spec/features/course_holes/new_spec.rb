require 'rails_helper'

RSpec.describe 'CourseHoles#New' do
  it 'links to the create new child page from course_holes index' do
    course = Course.create(name: 'Megido', difficulty: 4, par: 4, permanent: true)

    visit "/courses/#{course.id}/holes"

    click_link "Create Hole"

    expect(current_path).to eq "/courses/#{course.id}/holes/new"
  end


end
