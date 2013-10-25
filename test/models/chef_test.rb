require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class ChefTest < Test::Unit::TestCase
  context "Chef Model" do
    should 'construct new instance' do
      @chef = Chef.new
      assert_not_nil @chef
    end
  end
end
