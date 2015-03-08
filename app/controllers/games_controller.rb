class GamesController < ApplicationController
  before_action :authenticate_user_from_token!

   def index
     @games = current_user.games.all
     render json: {:game => @games}, status: :ok
   end

   def create
     @user = User.find(params[:user_id])
     @game = @user.games.create(game_params)
       if @game
         render json: {:game => @game}, status: :ok
       else
         render json: {:error => @game.errors}, status: :unprocessable_entity
       end
   end

   # def destroy
   #   @user = User.find(params[:user_id])
   #   @game = Game.find(params[:game_id])
   #   @user.games.find(@game)
   #
   # end


   private
   def game_params
     params.require(:game).permit(:longitude_start_point, :latitude_start_point, :radius, :user_id)
   end
end
