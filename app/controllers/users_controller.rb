class UsersController < ApplicationController
  before_action :authenticate_user_from_token!

  def show
    @user = current_user
    render json: { :user => @user }, status: :created
  end
  private
    def as_json(opts={})
      #opts.merge!
      super(:only => [:id, :email])
    end

end
