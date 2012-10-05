class RemoveTotalFemaleHeightFromGuess < ActiveRecord::Migration
  def up
    remove_column :guesses, :total_female_height
  end

  def down
    add_column :guesses, :total_female_height, :integer
  end
end
