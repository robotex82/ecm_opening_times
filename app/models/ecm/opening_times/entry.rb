module Ecm::OpeningTimes
  class Entry < ApplicationRecord
    DEFAULT_TIME_FORMAT = "%H:%M"

    belongs_to :branch, inverse_of: :entries

    validates :open_at, :close_at, presence: true

    module Times
      def default_time_format
        DEFAULT_TIME_FORMAT
      end

      def open_at=(time)
        if time.to_s =~ /([0-9]{2}):([0-9]{2})/
          write_attribute(:open_at, _time_to_minutes_since_midnight($~[1], $~[2]))
        else
          super
        end
      end

      def close_at=(time)
        if time.to_s =~ /([0-9]{2}):([0-9]{2})/
          write_attribute(:close_at, _time_to_minutes_since_midnight($~[1], $~[2]))
        else
          super
        end
      end

      def open_at(format: default_time_format)
        return nil if read_attribute(:open_at).nil?
        if format.nil?
          read_attribute(:open_at)
        else
          Time.at((read_attribute(:open_at) || 0) * 60).utc.strftime(format)
        end
      end

      def close_at(format: default_time_format)
        return nil if read_attribute(:close_at).nil?
        if format.nil?
          time = read_attribute(:close_at)
        else
          time = Time.at((read_attribute(:close_at) || 0) * 60).utc.strftime(format)
        end
        time == '00:00' ? '24:00' : time
      end

      def opening_times
        if open_all_day?
          { open_at: '00:00', close_at: '24:00' }
        else
          { open_at: open_at, close_at: close_at }
        end
      end

      def open_all_day=(open_all_day)
        if ActiveRecord::Type::Boolean.new.cast(open_all_day) == true
          self.open_at = '00:00'
          self.close_at = '24:00'
        end
      end

      def open_all_day
        open_at == '00:00' && close_at == '24:00'
      end

      def open_all_day?
        open_all_day
      end

      private

      def _time_to_minutes_since_midnight(hours, minutes)
        (hours.to_i * 60) + minutes.to_i
      end
    end

    prepend Times
  end
end
