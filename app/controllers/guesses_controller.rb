class GuessesController < ApplicationController
  def new
  	@guess = Guess.new
  end
end
