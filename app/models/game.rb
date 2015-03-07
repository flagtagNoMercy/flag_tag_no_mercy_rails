class Game < ActiveRecord::Base

  has_many :players
  # validates :user_games, :length => { :maximum => 10 }
  has_many :flags, through: :players
  has_many :users, through: :players

  def game_expired?
    #check when capture, set or display
  end

end
