FactoryGirl.define do
  factory :ecm_opening_times_entry, class: 'Ecm::OpeningTimes::Entry' do
    association :branch, factory: :ecm_opening_times_branch
    weekdays [1]
    open_at 9 * 60 * 60
    close_at 17 * 60 * 60
    open_all_day false
  end
end
