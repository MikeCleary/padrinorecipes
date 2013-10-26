PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

require "test/unit"
require 'database_cleaner'

DatabaseCleaner.strategy = :transaction

class Test::Unit::TestCase
  include Rack::Test::Methods

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
  # You can use this method to custom specify a Rack app
  # you want rack-test to invoke:
  #
  #   app PadrinoRecipes::App
  #   app PadrinoRecipes::App.tap { |a| }
  #   app(PadrinoRecipes::App) do
  #     set :foo, :bar
  #   end
  #
  def app(app = nil, &blk)
    @app ||= block_given? ? app.instance_eval(&blk) : app
    @app ||= Padrino.application
  end
end
