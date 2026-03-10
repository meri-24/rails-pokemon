Rails.application.routes.draw do
  root to: "pokemons#index"

  resources :pokemons, only: [:show] do
    resources :pokeballs, only: [:create] # POST /pokemons/pokemon_id/pokeballs

    collection do
      get :random      # GET /pokemons/random → PokemonsController#random
      get :autocomplete # GET /pokemons/autocomplete → PokemonsController#autocomplete (used by the search JS)
    end
  end

  resources :trainers, only: [:index, :show, :new, :create]

  resources :pokeballs, only: [:destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
