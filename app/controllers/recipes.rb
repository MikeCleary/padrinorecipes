PadrinoRecipes::App.controllers :recipes do

  layout :main
  
  get :index do
    @recipes = Recipe.all
    render 'recipes/index'
  end

  get :new, :parent => :author do
    @recipe = Recipe.new
    10.times {@recipe.ingredients << Ingredient.new}
    10.times {@recipe.steps << Step.new}
    render 'recipes/new'
  end

  get :show, :with => :id do
    @recipe = Recipe.find(params[:id])
    render 'recipes/show'
  end

  post :create do
    binding.pry
    @recipe = Recipe.new(params[:recipe])
    @recipe.save
  end

  put :update, :with => :id do
    r = Recipe.find(params[:id])
    r.update_attributes(params[:recipe])
    binding.pry
  end

  delete :destroy, :with => :id do
    r = Recipe.find(params[:id])
    r.destroy
    redirect_to url_for(:recipes, :index)
  end

end
