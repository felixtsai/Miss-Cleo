class Person < ActiveRecord::Base
  attr_accessible :height, :name, :sex, :weight

  validates :weight, :numericality => { :only_integer => true }
  after_create :population_add
  before_update :population_before_update
  after_update :population_after_update
  after_destroy :population_destroy

  def population_add
  	pop_state = PopulationState.first
  	if self.sex == "male"
  	  pop_state.total_males += 1
      pop_state.total_male_height += self.height
      pop_state.total_male_weight += self.weight
    else
      pop_state.total_females += 1
      pop_state.total_female_height += self.height
      pop_state.total_female_weight += self.weight  
    end
    pop_state.save
  end

  def population_before_update
      pop_state = PopulationState.first

    if self.sex == "male"
      pop_state.total_male_height -= Person.find(self.id).height
      pop_state.total_male_weight -= Person.find(self.id).weight
    else
      pop_state.total_female_height -= Person.find(self.id).height
      pop_state.total_female_weight -= Person.find(self.id).weight
    end
    pop_state.save
  end

  def population_after_update
      pop_state = PopulationState.first
    if self.sex == "male"
      pop_state.total_male_height += self.height
      pop_state.total_male_weight += self.weight
    else
      pop_state.total_female_height += self.height
      pop_state.total_female_weight += self.weight  
    end
    pop_state.save
  end

    def population_destroy
    pop_state = PopulationState.first
    if self.sex == "male"
      pop_state.total_males -= 1
      pop_state.total_male_height -= self.height
      pop_state.total_male_weight -= self.weight
    else
      pop_state.total_females -= 1
      pop_state.total_female_height -= self.height
      pop_state.total_female_weight -= self.weight  
    end
    pop_state.save
  end
end
