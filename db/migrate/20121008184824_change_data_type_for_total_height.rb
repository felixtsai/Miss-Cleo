class ChangeDataTypeForTotalHeight < ActiveRecord::Migration
  def up
		change_table :population_states do |t|
			t.change :total_male_height, :float
			t.change :total_female_height, :float
		end
  end

  def down
  	change_table :population_states do |t|
  		t.change :total_male_height, :integer
			t.change :total_female_height, :integer
  	end
  end
end
