class Person < ActiveRecord::Base
  attr_accessible :height, :name, :sex, :weight
  validates :height, :numericality => { :only_integer => true }
  validates :weight, :numericality => { :only_integer => true }
end
