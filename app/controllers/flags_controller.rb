class FlagsController < ApplicationController
  before_action :authenticate_user_from_token!
  #post 'users/:user_id/games/:id/flag'
  def set
    @user = current_user
    @players = @user.players
    @game = Game.find(params[:id])
    #binding.pry
    @flag = @players.find_by(:game_id => @game.id).flags.create(flag_params)
    if @flag
      render json: {:flag => @flag}, status: :ok
    else
      render json: {:flag => @flag.errors}, status: :unprocessable_entity
    end
  end

  private
  def flag_params
    params.require(:flag).permit(:latitude, :longitude,
                  :item_description, :radius, :flag_time_limit_minutes)
  end

end
