class Bout < ActiveRecord::Base
  # setting :wrestler according to article on: 
  #http://betterexplained.com/articles/intermediate-rails-understanding-models-views-and-controllers/
  belongs_to :red_wrestler, :class_name => 'Wrestler', :foreign_key => 'red_id'
  belongs_to :green_wrestler, :class_name => "Wrestler", :foreign_key => 'green_id'
  
  # TODO redo migration to remove this unneccessary table
  #has_and_belongs_to_many :wrestler
  
  belongs_to :event
  has_many :score
  
  before_validation :combine_minutes_and_seconds, :create_new_wrestlers_and_teams
  validates_numericality_of :red_id, :green_id
  
  attr_accessor :red_first_name, :red_last_name, :red_team_name
  attr_accessor :green_first_name, :green_last_name, :green_team_name
      
  def possible_scores
    @possible_scores = {:Takedown => 'takedown', 
                        :Escape => 'escape',
                        :Reverse => :reverse}
  end
  
  def possible_victories
    @possible_victories = ['Decision',
                           'Major Decision',
                           'Fall',
                           'Technical Fall',
                           'Disqualification',
                           'Forfeit',
                           'Injury Default']
  end
  
  def time_minutes
    # @time_minutes
    @time_minutes = (self.time.to_i / 60).round.to_i
  end
  
  def time_minutes=(min)
    @time_minutes = min.to_f
  end
  
  def time_seconds
    # padding per http://www.ruby-forum.com/topic/82137
    @time_seconds = "%02d"% (self.time.to_i % 60)
  end
  
  def time_seconds=(sec)
    @time_seconds = sec.to_f
  end
  
  def create_new_wrestlers_and_teams
    @red = Wrestler.find_by_first_name_and_last_name(@red_first_name, @red_last_name)
    @green = Wrestler.find_by_first_name_and_last_name(@green_first_name, @green_last_name)
    
    if @red.blank? and (!@red_first_name.blank? or !@red_last_name.blank?)
      @red = Wrestler.new :first_name => @red_first_name, :last_name => @red_last_name
      @red.save
    end
    if @green.blank? and (!@green_first_name.blank? or !@green_last_name.blank?)
      @green = Wrestler.new :first_name => @green_first_name, :last_name => @green_last_name
      @green.save
    end
    
    if !@red.blank?
      self.red_id = @red.id
    end
    if !@green.blank?
      self.green_id = @green.id
    end
  end
  
  def combine_minutes_and_seconds
    @sec = @time_seconds
    @min = @time_minutes
    
    @min = 0.0 if @min.blank?
    @sec = 0.0 if @sec.blank?
    
    self.time = @min.to_f * 60 + @sec.to_f
  end
end
