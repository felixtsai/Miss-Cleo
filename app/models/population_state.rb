class PopulationState < ActiveRecord::Base
  attr_accessible :total_female_height, :total_female_weight, :total_females, :total_male_height, :total_male_weight, :total_males, :variance_height, :variance_weight



  def total_probability_male
  	total_males/Person.count
  end

  def variance_height_male
  	heights_male = Person.all.collect {|person| Person.height}
  	1/(total_males - 1) * heights_male.inject {|sum, height| sum + (height - total_male_height/total_males)**2}
  end

  def probability_height_male



end
