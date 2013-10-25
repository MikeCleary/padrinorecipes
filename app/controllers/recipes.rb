PadrinoRecipes::App.controllers :recipes do
  
  get :index do
    @recipes = Recipe.all

  end

  get :new do

  end

  post :create do
    binding.pry
    @recipe = Recipe.new(params[:recipe])
    @recipe.save
  end

  put :update do

  end

  delete :destroy do

  end

end
