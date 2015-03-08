class FlagsController < ApplicationController
  def capture(flag_latitude, flag_longitude, player_latitude, player_longitude, flag_id, game_id)
    latitude = flag_params[:latitude]
    longitude = flag_params[:longitude]
    @flag = Flag.find_by(latitude: latitude, longitude: longitude)
    distance_in_miles = Geocoder::Calculations.distance_between([@flag.latitude,@flag.longitude], [latitude,longitude])
    distance_in_feet = distance_in_miles*5280

    @user = current_user
    @game = Game.find(params[:game_id])
    @player = @user.players.find_by(@game.id)

    if distance <= @flag.radius
      #decrement current_value, flag captured
      new_val = @flag.current_value - 1
      Flag.find(params[:id]).update_attribute(:current_value, new_val)
      #if last player, award no points
      if @game.players.count != 10 - @flag.current_value
        total_points = @player.points + @flag.current_value + 1
        Player.find(@player.id).update_attribute(:points, total_points)
        #add flag to captured flags
        #render json
      end
    else
      #fail capture render json
    end
  end
  private
  def flag_params
  end
end
