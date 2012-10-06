class CreatePopulationStates < ActiveRecord::Migration
  def change
    create_table :population_states do |t|
      t.integer :total_females
      t.integer :total_males
      t.string :total_female_height
      t.integer :total_male_height
      t.integer :total_female_weight
      t.integer :total_male_weight

      t.timestamps
    end
  end
end
