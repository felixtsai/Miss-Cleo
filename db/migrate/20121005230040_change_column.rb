class ChangeColumn < ActiveRecord::Migration
  def up
  	change_column :population_states, :total_females, :integer, :default => 0
    change_column :population_states, :total_males, :integer, :default => 0
    change_column :population_states, :total_female_height, :integer, :default => 0
    change_column :population_states, :total_male_height, :integer, :default => 0
    change_column :population_states, :total_female_weight, :integer, :default => 0
    change_column :population_states, :total_male_weight, :integer, :default => 0
  end

  def down
  	change_column :population_states, :total_females, :integer, :default => nil
    change_column :population_states, :total_males, :integer, :default => nil
    change_column :population_states, :total_female_height, :integer, :default => nil
    change_column :population_states, :total_male_height, :integer, :default => nil
    change_column :population_states, :total_female_weight, :integer, :default => nil
    change_column :population_states, :total_male_weight, :integer, :default => nil
  end
end
