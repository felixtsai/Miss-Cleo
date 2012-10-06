class PopulationState < ActiveRecord::Base
  attr_accessible :total_female_height, :total_female_weight, :total_females, :total_male_height, :total_male_weight, :total_males

  def pop_data
    @population_data ||= {:male => {total: total_males, height: total_male_height, weight: total_male_weight},
      female: {total: total_females, height: total_female_height, weight: total_female_weight}}
  end

  def mean(gender, attribute)
    pop_data[gender][attribute]/pop_data[gender][:total].to_f
  end

  def overall_prob(gender)
    gender == :male ? total_males/Person.count.to_f : total_females/Person.count.to_f
  end

  def variance(gender, attribute)
    attribute_collection = []
    Person.all.each do |person|
     if person.sex == gender.to_s
      attribute_collection << person.send(attribute)
     end
    end
    (1/(pop_data[gender][:total] - 1).to_f)* attribute_collection.inject(0) {|sum, attrib| sum + (attrib - mean(gender, attribute))**2}
  end

  def attr_prob(gender, attribute)
    (1/Math.sqrt(2*Math::PI*variance(gender, attribute)**2))**((-(6-mean(gender, attribute))**2)/2*variance(gender, attribute))
  end

 
  def posterior(gender)
    overall_prob(gender)*attr_prob(gender, :height)*attr_prob(gender, :weight)
  end

  def guess
    if total_males <= 1 || total_females <= 1
      "Not enough information. Please enter more person data."      
    elsif posterior(:male) > posterior(:female)
      "Our guess is male."
    elsif
      posterior(:female) > posterior(:male)
     "Our guess is female."
    else
      "Equal probability. Flip a coin."
    end
  end   



end
