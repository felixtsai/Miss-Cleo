class GuessesController < ApplicationController
  def new
  	@guess = Guess.new
  end

  def create
	@guess = Guess.create(params[:guess])
  	redirect_to new_guess_path
  end

end
