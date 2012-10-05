class AddSexToGuess < ActiveRecord::Migration
  def change
    add_column :guesses, :sex, :string
  end
end
