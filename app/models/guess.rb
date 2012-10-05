class Guess < ActiveRecord::Base
  attr_accessible :height, :weight, :name
  validates :height, :numericality => { :only_integer => true }
  validates :weight, :numericality => { :only_integer => true }

end

