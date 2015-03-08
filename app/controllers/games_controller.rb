class GamesController < ApplicationController
  before_action :authenticate_user_from_token!

   def index
     @games = Game.all
     render json: {:game => @games}, status: :ok
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
# moved join to players controller...
   def join
     @game = Game.find(params[:id])
     @player = @game.players
     @user = current_user
    # binding.pry
     if @player.count < 10 && !@game.users.include?(@user)
       @game.users << @user
       render json: {:game_users => @game.users, :game =>@game}, status: :ok
     else
       render json: {:error => @game.errors}, status: :bad_request
     end
   end

    def destroy #what exactly to destroy?
      @user = current_user #User.find(params[:user_id])
      @game = @user.games.find(params[:id])#Game.find(params[:id])
      if @user.games.find(@game)
        @user.games.find(@game).destroy
        render json: {:message => "User delete"}, status: :ok
      else
        render json: {:message => "Couldn't delete user"}
      end

    end


   private
   def game_params
     params.require(:game).permit(:longitude_start_point, :latitude_start_point, :radius, :user_id)
   end
end
