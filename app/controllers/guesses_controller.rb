class GuessesController < ApplicationController

  def index
	@guesses = Guess.all
  end

  def new
  	@guess = Guess.new
  end

  def create
	@guess = Guess.new(params[:guess])
  @guess.height = @guess.height/12.0
  @guess.save
  	redirect_to @guess
  end

  def show
  	@guess = Guess.find(params[:id])
  	@pop_state = PopulationState.find(1)
  end


end
