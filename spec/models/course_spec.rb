require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'instance methods' do
    describe '#index' do
      course = Course.create(name: "Bradley Park", permanent: true, par: 3, difficulty: 3 )

      expect(course.index).to be(true)


    end
  end
end
