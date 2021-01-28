Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :stories
      resources :cards
    end
  end
end
