require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class RecipeTagTest < Test::Unit::TestCase
  context "RecipeTag Model" do
    should 'construct new instance' do
      @recipe_tag = RecipeTag.new
      assert_not_nil @recipe_tag
    end
  end
end
