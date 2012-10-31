class Spec < ActiveRecord::Base
  belongs_to :unp
  attr_accessible :date, :number, :sum
end
