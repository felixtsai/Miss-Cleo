class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :total_male_height
      t.integer :total_male_weight
      t.integer :total_female_height
      t.integer :total_female_weight

      t.timestamps
    end
  end
end
