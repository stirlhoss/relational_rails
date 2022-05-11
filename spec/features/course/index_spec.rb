require 'rails_helper'

RSpec.describe 'course index page', type: :feature do
  it "can see all courses in the database" do
      course = Course.create!(name: "Bradley Park", permanent: true, par: 3, difficulty: 3)
      course2 = Course.create!(name: "Eureka", permanent: false, par: 4, difficulty: 5)

      visit "/courses"

      expect(page).to have_content(course.name)
  end

end
