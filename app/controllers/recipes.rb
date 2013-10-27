PadrinoRecipes::App.controllers :recipes do

  layout :main
  
  get :index do
    @recipes = Recipe.all
    render 'recipes/index'
  end

  get :new, :parent => :chefs do
    @recipe = Recipe.new
    10.times {@recipe.ingredients << Ingredient.new}
    10.times {@recipe.steps << Step.new}
    @tags = Tag.all.map{|t| [t.name , t.id ]}
    render 'recipes/new'
  end

  get :show, :with => :id do
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new(:recipe => @recipe)
    render 'recipes/show'
  end

  post :create do
    binding.pry
    @recipe = Recipe.new(params[:recipe])
    @recipe.save
  end

  get :edit, :with => :id do
    @recipe = Recipe.find(params[:id])
    @tags = Tag.all.map{|t| [t.name , t.id ]}
    render 'recipes/edit'
  end

  put :update, :with => :id do
    r = Recipe.find(params[:id])
    r.update_attributes(params[:recipe])
  end

  delete :destroy, :with => :id do
    r = Recipe.find(params[:id])
    r.destroy
    redirect_to url_for(:recipes, :index)
  end

  get :tagged, :with => :tag, :map => '/recipes/tagged' do
    @recipes = Tag.where("name =?", params[:tag]).first.recipes
    render 'recipes/index'
  end

end
