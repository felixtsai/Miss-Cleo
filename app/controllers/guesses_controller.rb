class GuessesController < ApplicationController

  def index
	@guesses = Guess.all
  end

  def new
  	@guess = Guess.new
  end

  def create
	@guess = Guess.create(params[:guess])
  	redirect_to @guess
  end

  def show
  	@guess = Guess.find(params[:id])
  	@pop_state = PopulationState.find(1)
  end


end
