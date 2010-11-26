class Wrestler < ActiveRecord::Base
  has_and_belongs_to_many :team
  #has_and_belongs_to_many :bout
  has_many :bout
  has_many :score
  
  def first_last 
    "#{first_name} #{last_name}"
  end
  
end
