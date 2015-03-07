class GamesController < ApplicationController
  before_action :authenticate_user_from_token!

   def index
     @games = Game.all
     render json: {:game => @games}, status: :ok
   end

   

   private
   def game_params
     params.require(:game).permit(:longitude_start_point, :latitude_start_point, :radius, :user_id)
   end
end
