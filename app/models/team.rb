class Team < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :wrestler
  has_and_belongs_to_many :event
  
  validates_presence_of :team_name
end
