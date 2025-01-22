Rails.application.routes.draw do
  # Monta as engines do Rswag para a documentação da API
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :beers do
    resources :food_pairings # Para associar food pairings diretamente a beers.
  end

  resources :pubs do
    resources :beers # Para associar beers diretamente a pubs.
  end

  resources :food_pairings # Rota independente para food pairings.

	get '/coverage', to: 'coverage#index'

end


