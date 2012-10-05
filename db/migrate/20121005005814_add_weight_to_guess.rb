class AddWeightToGuess < ActiveRecord::Migration
  def change
    add_column :guesses, :weight, :integer
  end
end
