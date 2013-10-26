require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ChefsControllerTest < Test::Unit::TestCase
  context "ChefsController" do
    context "chef index page" do
      setup do
        get '/'
      end

      should "work" do
        assert last_response.ok
      end
    end

    context "create chef" do
      setup do
        
      end
    end
  end
end
