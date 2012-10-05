class RemoveTotalFemaleHeightFromPopulationState < ActiveRecord::Migration
  def up
    remove_column :population_states, :total_female_height
    remove_column :population_states, :total_male_height
    remove_column :population_states, :total_female_weight
    remove_column :population_states, :total_male_weight
    remove_column :population_states, :total_females
    remove_column :population_states, :total_males
    remove_column :population_states, :variance_height
    remove_column :population_states, :variance_weight

  end

  def down
    add_column :population_states, :total_female_height, :integer
    add_column :population_states, :total_male_height, :integer
    add_column :population_states, :total_female_weight, :integer
    add_column :population_states, :total_male_weight, :integer
    add_column :population_states, :total_females, :integer
    add_column :population_states, :total_males, :integer
    add_column :population_states, :variance_height, :float
    add_column :population_states, :variance_weight, :float

  end
end
