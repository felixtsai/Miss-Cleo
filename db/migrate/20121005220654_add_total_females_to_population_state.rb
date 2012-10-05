class AddTotalFemalesToPopulationState < ActiveRecord::Migration
  def change
    add_column :population_states, :total_females, :integer, :default => 0
    add_column :population_states, :total_males, :integer, :default => 0
    add_column :population_states, :total_female_height, :integer, :default => 0
    add_column :population_states, :total_male_height, :integer, :default => 0
    add_column :population_states, :total_female_weight, :integer, :default => 0
    add_column :population_states, :total_male_weight, :integer, :default => 0
  end
end
