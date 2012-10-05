class GuessesController < ApplicationController
  def new
  	
  end

  def create
  	@height = params[:height]
  	@weight = params[:weight]
  	redirect_to new_guess_path
  end

end
