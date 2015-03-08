class UsersController < ApplicationController
  before_action :authenticate_user_from_token!

  #invite - mailer...
  def index
    @user = User.all
    render json: {:user => @user}
  end

  def invite
    InviteMailer.invite(users).deliver_now
    redirect_to :index
  end

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
