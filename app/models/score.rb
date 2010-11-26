class Score < ActiveRecord::Base
  belongs_to :bout
  belongs_to :wrestler
end
