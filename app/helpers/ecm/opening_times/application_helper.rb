module Ecm
  module OpeningTimes
    module ApplicationHelper
      def opening_times
        @branches = Ecm::OpeningTimes::Branch.all
        render partial: 'ecm/opening_times/branches/opening_times', locals: { branches: @branches }
      end
    end
  end
end
