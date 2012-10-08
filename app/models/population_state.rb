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
     end #end if
    end #end each
    (1/(pop_data[gender][:total] - 1).to_f)* attribute_collection.inject(0) {|sum, attrib| sum + (attrib - mean(gender, attribute))**2}
  end #end variance

  def attr_prob(gender, attribute, guess_attribute)
   (1/Math.sqrt(2*Math::PI*variance(gender, attribute))) * Math.exp((-(guess_attribute - mean(gender, attribute))**2)/(2*variance(gender, attribute)))
  end

 
  def posterior(gender, guess_height, guess_weight)
    overall_prob(gender)*attr_prob(gender, :height, guess_height)*attr_prob(gender, :weight, guess_weight)
  end

  def guess(height, weight)
    if total_males <= 1 || total_females <= 1
      "Not enough information. Please enter more person data."      
    elsif posterior(:male, height, weight) > posterior(:female, height, weight)
      "male."
    elsif
      posterior(:female, height, weight) > posterior(:male, height, weight)
     "female."
    else
      "Androgynous. Flip a coin."
    end
  end   

end
