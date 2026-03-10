class PokemonsController < ApplicationController

  def index
    if params[:search]
      @pokemons = Pokemon.where("name ILIKE ?", "%#{params[:search]}%")
    else
      @pokemons = Pokemon.order("RANDOM()").limit(35)
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @pokeball = Pokeball.new(pokemon: @pokeball, caught_on: Date.today)
  end

  def random
    @pokemon = Pokemon.order("RANDOM()").first
    @pokeball = Pokeball.new(pokemon: @pokemon, caught_on: Date.today)
    render :show
  end

  def autocomplete
    names = Pokemon
      .where("name ILIKE ?", "%#{params[:query]}%")
      .order(:name)
      .limit(8)
      .pluck(:name)
    render json: names
  end
end
