class SessionsController < ApplicationController
  ADMIN_EMAIL = 'pdonat@seznam.cz'

  def create
    user = User.where(login_token: params[:token]).where('login_token_valid_until > ?', Time.now).first

    if user
      if user.email != ADMIN_EMAIL
        redirect_to root_path, alert: 'Přihlášení se nezdařilo. Zatím funguje přihlašování pouze pro adminy.'
        return
      end

      user.update!(login_token: nil, login_token_valid_until: 1.year.ago)

      self.current_user = user
      redirect_to root_path
    else
      redirect_to root_path, alert: 'Přihlášení se nezdařilo. Nejspíš jsi použil starý přihlašovací link. Zkus vygenerovat nový.'
    end
  end

  def destroy
    self.current_user = NullUser.new
    redirect_to root_path
  end
end
