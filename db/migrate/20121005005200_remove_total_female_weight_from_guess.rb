class RemoveTotalFemaleWeightFromGuess < ActiveRecord::Migration
  def up
    remove_column :guesses, :total_female_weight
  end

  def down
    add_column :guesses, :total_female_weight, :integer
  end
end
