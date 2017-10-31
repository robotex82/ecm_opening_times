require 'rails_helper'

module Ecm::OpeningTimes
  RSpec.describe Branch, type: :model do
    it { expect(subject).to have_many(:entries) }
    
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_uniqueness_of(:name) }
  end
end
