module Ecm
  module OpeningTimes
    module ApplicationHelper
      def opening_times(options = {})
        options.reverse_merge(branches: nil)
        case options[:branches]
        when Array, Symbol, String
          @branches = Ecm::OpeningTimes::Branch.where(identifier: options[:branches]).all
        else
          @branches = Ecm::OpeningTimes::Branch.all
        end
        render partial: 'ecm/opening_times/branches/opening_times', locals: { branches: @branches }
      end
    end
  end
end
