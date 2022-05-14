require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :permanent }
    it { should validate_presence_of :par }
    it { should validate_presence_of :difficulty }
  end

  describe 'relationships' do
    it { should have_many :holes }
  end

  describe 'model methods' do
    before :each do
      @course1 = Course.create!(name: 'Bradley Park',
                                permanent: true,
                                par: 3,
                                difficulty: 3,
                                created_at: '2022-05-10 22:08:37.423105')
      @course2 = Course.create!(name: 'Eureka',
                                permanent: true,
                                par: 4,
                                difficulty: 5,
                                created_at: '2022-05-11 22:08:37.423105')
      @course3 = Course.create!(name: 'Washington',
                                permanent: true,
                                par: 2,
                                difficulty: 1,
                                created_at: '2022-05-18 22:08:37.423105')
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
      @hole3 = Hole.create!(name: 'Over the Resevoir',
                            distance_to_pin: 520,
                            par: 4,
                            permanent: true,
                            course_id: @course2.id)
    end
    it '.order_by_recently_created' do
      expect(Course.order_by_recently_created).to eq [@course3, @course2, @course1]
    end

    it '#hole.count counts the number of holes that a given course has' do
      expect(@course1.hole_count).to eq 2
      expect(@course2.hole_count).to eq 1
      expect(@course3.hole_count).to eq 0
    end
  end
end
