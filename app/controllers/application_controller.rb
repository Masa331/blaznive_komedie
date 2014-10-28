class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path
  end

  private

  def load_random_comedies
    @random_comedies = Comedy.publicable.random
  end
end
