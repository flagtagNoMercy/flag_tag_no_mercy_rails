class GamesController < ApplicationController
  before_action :authenticate_user_from_token!

   def index
     #binding.pry
     @games = current_user.games.all
     render json: {:game => @games}, status: :ok
   end

   #GET    /users/:user_id/games/:id
   def show
     @game = Game.find(params[:id])
     @players = @game.players.all
     @flag = @game.flags
     @finish_check = finished?(@game)
     render json: {:players => @players, :email => @game.users.select(:email, :id),
                   :game => {:id => @game.id, :radius => @game.radius,
                   :time_limit => @game.time_limit, game_finished: @finish_check
                   }, :flags => @flag  }, status: :ok
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

     def finished?(game)
       game.created_at + game.time_limit.minutes < Time.now
     end
end
