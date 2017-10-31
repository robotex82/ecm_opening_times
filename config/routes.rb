Ecm::OpeningTimes::Engine.routes.draw do
  localized do
    scope :ecm_opening_times_engine do
      resources :branches, only: [:index]

      root to: 'branches#index'
    end
  end
end
