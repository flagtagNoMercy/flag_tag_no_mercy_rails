class Flag < ActiveRecord::Base

  belongs_to :player
  belongs_to :game

  has_many :capture_flags

end
