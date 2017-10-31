require 'rails_helper'

module Ecm::OpeningTimes
  RSpec.describe Entry, type: :model do
    it { expect(subject).to belong_to(:branch) }

    it { expect(subject).to validate_presence_of(:branch).with_message(:required) }
    it { expect(subject).to validate_presence_of(:weekdays) }
    it { expect(subject).to validate_inclusion_of(:open_all_day).in_array([true, false])}

    describe 'when not all day open' do
      before(:each) { subject.open_all_day = false }

      it { expect(subject).to validate_presence_of(:open_at) }
      it { expect(subject).to validate_presence_of(:close_at) }
    end

    describe 'when all day open' do
      before(:each) { subject.open_all_day = true }

      it { expect(subject).not_to validate_presence_of(:open_at) }
      it { expect(subject).not_to validate_presence_of(:close_at) }
    end
  end
end
