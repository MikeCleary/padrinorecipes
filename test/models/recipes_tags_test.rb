require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class RecipesTagsTest < Test::Unit::TestCase
  context "RecipesTags Model" do
    should 'construct new instance' do
      @recipes_tags = RecipesTags.new
      assert_not_nil @recipes_tags
    end
  end
end
