class InviteMailer < ApplicationMailer

  def Invite(user)
    @user = user
    mail(to: @user.email)
  end
end
