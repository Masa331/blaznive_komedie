if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start 'rails'
end

require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
# require 'capybara/email/rspec'
# require 'vcr'
# require 'webmock/rspec'
require "paperclip/matchers"

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Paperclip::Shoulda::Matchers

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
