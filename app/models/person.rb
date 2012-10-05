class Person < ActiveRecord::Base
  attr_accessible :height, :name, :sex, :weight

  validates :height, :numericality => { :only_integer => true }
  validates :weight, :numericality => { :only_integer => true }
  after_create :population_update
  

  end

  after_update

  def population_update
  	@pop_state = PopulationState.first
  	if self.sex == "M"
  		pop_state.total_males += 1
    end
  end
end
