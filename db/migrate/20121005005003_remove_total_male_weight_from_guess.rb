class RemoveTotalMaleWeightFromGuess < ActiveRecord::Migration
  def up
    remove_column :guesses, :total_male_weight
  end

  def down
    add_column :guesses, :total_male_weight, :integer
  end
end
