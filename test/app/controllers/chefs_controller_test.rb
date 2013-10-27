require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ChefsControllerTest < Test::Unit::TestCase
  context "ChefsController" do
    context "chef index page" do
      setup do
        get '/chefs'
      end

      should "work" do
        assert last_response.ok?
      end
    end

    context "create chef" do
      setup do
        form_parameters = { :chef => {
          :first_name => "Gordon",
          :last_name => "Ramsey",
          :michelin => 16
          }
        }
      
        post 'chefs/create', form_parameters
      end

      should "create a chef" do
        assert_equal 1, Chef.count
        assert_equal "Gordon", Chef.all.first.first_name
        assert_equal "Ramsey", Chef.all.first.last_name
        assert_equal 16, Chef.all.first.michelin
      end
    end
  end
end
