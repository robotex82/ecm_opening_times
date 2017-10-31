module Ecm::OpeningTimes
  class Branch < ApplicationRecord
    has_many :entries, inverse_of: :branch
    accepts_nested_attributes_for :entries

    acts_as_list
    default_scope -> { order(:position) }

    attr_readonly :identifier

    validates :identifier, presence: true, uniqueness: true
    validates :name,       presence: true, uniqueness: true

    def entries_by_weekday
      weekdays.each_with_object({}) do |weekday, hash|
        hash[weekday] = entries_for_weekday(weekday)
      end
    end

    def entries_for_weekday(weekday)
      entries.select { |entry| entry.send(weekday) }
    end

    def opening_times_for_weekday(weekday)
      entries_for_weekday(weekday).map(&:opening_times)
    end

    private

    def weekdays
      [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
    end
  end
end
