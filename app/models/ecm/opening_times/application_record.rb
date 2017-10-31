module Ecm
  module OpeningTimes
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
      self.table_name_prefix = 'ecm_opening_times_'
    end
  end
end
