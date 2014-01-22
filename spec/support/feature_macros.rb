include Warden::Test::Helpers

module FeatureMacros
  def login_admin
    admin = create(:admin)
    login_as admin, scope: :admin
  end
end

RSpec.configure do |config|
  config.include FeatureMacros
end
