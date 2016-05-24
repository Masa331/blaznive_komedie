class LoginMailer < ApplicationMailer

  def login_link(user)
    @user = user

    mail to: @user.email, subject: 'Přihlášení do blaznivekomedie.cz'
  end
end
