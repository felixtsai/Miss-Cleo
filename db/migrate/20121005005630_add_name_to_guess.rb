class AddNameToGuess < ActiveRecord::Migration
  def change
    add_column :guesses, :name, :string
  end
end
