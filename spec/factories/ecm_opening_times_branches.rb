FactoryGirl.define do
  factory :ecm_opening_times_branch, class: 'Ecm::OpeningTimes::Branch' do
    sequence(:name) { |i| "Branch #{i}"}
  end
end
