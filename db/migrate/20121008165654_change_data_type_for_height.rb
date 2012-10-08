class ChangeDataTypeForHeight < ActiveRecord::Migration
  def up
  	change_table :people do |t|
  		t.change :height, :float
  	end
  end

  def down
  	change_table :people do |t|
  		t.change :height, :float
  	end
  end
end
