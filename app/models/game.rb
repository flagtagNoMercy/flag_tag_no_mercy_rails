class Game < ActiveRecord::Base

  has_many :user_games
  # validates :user_games, :length => { :maximum => 10 }
  has_many :flags, through: :players
  has_many :users, through: :user_games

  def game_expired?
    #check when capture, set or display
  end

end
