require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class RecipesControllerTest < Test::Unit::TestCase
  context "recipes controller" do 
    context "recipe create" do
      setup do
          form_parameters = { :recipe => {
            :title => "Bangers and mash",
            :description => 'yummy', 
            :cook_time => 30,
            :prep_time => 90,
            :serves => 4
            }
          }
        
        post '/recipes/create', form_parameters
      end

      should "be a recipe" do
        assert_equal 1, Recipe.count
      end
    end

    context "recipe show" do 
      setup do
        
        @chef = Chef.new(:first_name => "Gordon",
          :last_name => "Ramsey",
          :michelin => 16
          )

        @recipe = Recipe.new(
          :title => "Bangers and Mash",
          :description => "yummy", 
          :cook_time => 30,
          :prep_time => 90,
          :serves => 4
          )    
        get '/recipes'
      end

      should "show a recipe" do 
        assert_match /Bangers and Mash/, last_response.body
        assert_match /yummy/, last_reponse.body
        assert_match /30 minutes/, last_reponse.body
      end
    end  
  end
end
