class Game < ActiveRecord::Base

  has_many :user_games
  # validates :user_games, :length => { :maximum => 10 }
  has_many :flags, through: :players
  has_many :users, through: :user_games

  def game_expired?
    #check when capture, set or display
  end

  def create
    @user = User.find(params[:user_id])
    @game = @user.games.create(game_params)
      if @game.save
        render json: {:game => @game}, status: :ok
      else
        render json: {:error => @game.errors}, status: :unprocessable_entity
      end
  end

  private
  def game_params
    params.require(:game).permit(:latitude_start_point, :longitude_start_point, :radius, :user_id)
  end

end
