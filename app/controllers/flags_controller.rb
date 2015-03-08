class FlagsController < ApplicationController
  before_action :authenticate_user_from_token!

  def capture
    #player_id, :latitude, :longitude, :user_latitude, :user_longitude
    #if game not finished
    distance = distance_between_user_and_flag
    @user = current_user
    @player = @user.players.find_by(:game_id => @game.id)
    if (distance <= @flag.radius) && (@player.id!=@flag.player_id)
      @capture = @flag.capture_flags.create(:player_id => @player.id, :value => @flag.current_value)
      @flag.update_attribute :current_value, @flag.current_value - 1
      unless @flag.capture_flags.count == @game.players.count
        @player.update_attribute :points, @player.points + @capture.value
      end
       render json: {:message => "Captured flag", :points => @player.points}, status: :ok
    else
       render json: {:message => "Could not capture flag"}, status: :unprocessable_entity
     end
  end

  private

  def distance_between_user_and_flag
    latitude = flag_params[:latitude]
    longitude = flag_params[:longitude]
    user_latitude = flag_params[:player_latitude]
    user_longitude = flag_params[:player_longitude]
    @flag = Flag.find_by(latitude: latitude, longitude: longitude)
    distance_in_miles = Geocoder::Calculations.distance_between([@flag.latitude,@flag.longitude], [user_latitude,user_longitude])
    distance_in_feet = distance_in_miles*5280
  end

  #post 'users/:user_id/games/:id/flag'
  def set
    #if game not finished and player flag_set_count!=1
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


  def flag_params
    params.require(:flag).permit(:latitude, :longitude,
                  :item_description, :radius, :flag_time_limit_minutes,
                  :player_latitude, :player_longitude)
  end

end
