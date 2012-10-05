class RemoveTotalMaleHeightFromGuess < ActiveRecord::Migration
  def up
  	remove_column :guesses, :total_male_height
  end

  def down
  	add_column :guesses, :total_male_height, :integer
  end
end
