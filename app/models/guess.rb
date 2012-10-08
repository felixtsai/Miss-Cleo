class Guess < ActiveRecord::Base
  attr_accessible :height, :weight, :name
  validates :weight, :numericality => { :only_integer => true }

end

