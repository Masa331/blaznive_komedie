class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_random_comedies

  private

  def load_random_comedies
    @random_comedies = Comedy.random
  end
end
