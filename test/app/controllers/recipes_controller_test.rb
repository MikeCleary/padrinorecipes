require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class RecipesControllerTest < Test::Unit::TestCase
  context "recipes controller" do 
    context "a recipe" do
      
    end

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

    context "recipe index" do 
      setup do
        
        @chef = Chef.new(:first_name => "Gordon",
          :last_name => "Ramsey",
          :michelin => 16
          )

        @recipe1 = Recipe.create(
          :title => "Bangers and Mash",
          :description => "yummy", 
          :cook_time => 30,
          :prep_time => 90,
          :serves => 4
          )

        @recipe2 = Recipe.create(
          :title => "Porridge",
          :description => "yuk", 
          :cook_time => 30,
          :prep_time => 90,
          :serves => 4
          )    
        get '/recipes'
      end

      should "show all recipe" do 
        assert_match /Bangers and Mash/, last_response.body
        assert_match /yummy/, last_response.body
        assert_match /Porridge/, last_response.body
        assert_match /yuk/, last_response.body
      #  assert_match /30 minutes/, last_reponse.body
      end
    end

    context "update recipes" do

      setup do
        @recipe2 = Recipe.create(
          :title => "Porridge",
          :description => "yuk"
          )    

        form_parameters = { :recipe => {
            :title => "Bangers and mash",
            :description => 'yummy'
            }
          }

        put "/recipes/update/#{@recipe2.id}", form_parameters
        @recipe2.reload
      end

      should "update a recipe" do
        assert_equal "Bangers and mash", @recipe2.title
        assert_equal "yummy", @recipe2.description
      end
    end  
  end
end
