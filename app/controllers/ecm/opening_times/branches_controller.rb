module Ecm
  module OpeningTimes
    class BranchesController < Ecm::OpeningTimes::ApplicationController
      include Controller::ResourceConcern
      include Controller::ResourceUrlsConcern
      include Controller::ResourceInflectionsConcern
      include Controller::RestActionsConcern

      def self.resource_class
        Ecm::OpeningTimes::Branch
      end
    end
  end
end
