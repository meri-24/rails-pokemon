class PokeballsController < ApplicationController
  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @trainer = Trainer.find(params[:pokeball][:trainer_id])
    @pokeball = Pokeball.new(pokeball_params)
    @pokeball.pokemon = @pokemon
    @pokeball.trainer = @trainer

    if pokemon_caught?
     return redirect_to trainer_path(@pokemon), alert: "#{@trainer.name} failed to catch #{@pokemon.name}."
    end

    if @pokeball.save
      redirect_to trainer_path(@trainer)
    else
      render "pokemons/show", status: :unprocessable_entity
    end

  end

  private

  def pokeball_params
    params.require(:pokeball).permit(:location, :caught_on)
  end

  def pokemon_caught?
    rand(0..1) == 1
  end
end
