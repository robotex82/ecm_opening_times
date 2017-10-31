Rails.application.routes.draw do
  mount Ecm::OpeningTimes::Engine => "/opening-times"
end
