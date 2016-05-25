class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_random_comedies
  before_action :set_view_variant

  private

  def set_view_variant
    request.variant = detect_browser
  end

  def detect_browser
    if params[:v].present?
      case params[:v]
      when 'phone' then :phone
      when 'tablet' then :tablet
      end
    elsif browser.device.tablet?
      :tablet
    elsif browser.device.mobile?
      :phone
    end
  end

  def load_random_comedies
    @random_comedies = Comedy.random
  end
end
