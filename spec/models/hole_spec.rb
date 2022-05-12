require 'rails_helper'

RSpec.describe Hole do
    describe 'validations' do
      it { should validate_presence_of :name }
      it { should validate_presence_of :permanent }
      it { should validate_presence_of :par }
      it { should validate_presence_of :distance_to_pin }
    end

    describe 'relationships' do
      it { should belong_to :course }
    end

end
