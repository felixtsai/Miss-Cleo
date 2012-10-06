class DropTable < ActiveRecord::Migration
  def up
  	drop_table :population_states
  end

  def down
  end
end
