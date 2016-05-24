class LoginsController < ApplicationController
  def new
    unless current_user.anonymous?
      redirect_to root_path, notice: 'Již jsi přihlášný'
    end
  end

  def create
    user = User.find_or_create_by!(email: params[:email]) do |user|
      user.name = 'tomas'
    end
    user.update!(login_token: generate_token, login_token_valid_until: Time.now + 15.minutes)

    LoginMailer.login_link(user).deliver

    redirect_to root_path, notice: 'Pro přihlášení klikni na link, který ti byl právě zaslán na email.'
  end

  private

  def generate_token
    SecureRandom.urlsafe_base64
  end
end
