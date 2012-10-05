class AddHeightToGuess < ActiveRecord::Migration
  def change
    add_column :guesses, :height, :integer
  end
end
