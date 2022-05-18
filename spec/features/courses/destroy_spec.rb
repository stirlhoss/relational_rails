require 'rails_helper'

RSpec.describe 'destroying a course' do
  it 'can delete the course from the index page' do
    course = Course.create(name: 'Megido', difficulty: 4, par: 4, permanent: true)
    visit '/courses'
    click_button 'Delete'
    expect(current_path).to eq('/courses')
    expect(page).to_not have_content('Megido')
  end

end
