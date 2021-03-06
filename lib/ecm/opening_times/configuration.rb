require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'

module Ecm
  module OpeningTimes
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :base_controller do
        'ApplicationController'
      end
    end
  end
end
