require 'rails_helper'

RSpec.describe Hole do
    describe 'validations' do
      it { should validate_presence_of :name }
      # it { should validate_presence_of :permanent }
      it { should validate_presence_of :par }
      it { should validate_presence_of :distance_to_pin }
    end

    describe 'relationships' do
      it { should belong_to :course }
    end

  describe 'model methods' do
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
    end

    describe 'boolean sorting' do
      it 'only shows the holes that are permanent' do

        expect(Hole.permanent_holes).to eq([@hole1])
      end
    end
  end
end
