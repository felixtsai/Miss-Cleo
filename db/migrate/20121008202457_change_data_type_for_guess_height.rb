class ChangeDataTypeForGuessHeight < ActiveRecord::Migration
  def up
		change_table :guesses do |t|
			t.change :height, :float
		end
  end

  def down
  	change_table :guesses do |t|
  		t.change :height, :integer
  	end
  end
end
