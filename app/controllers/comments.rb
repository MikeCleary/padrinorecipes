PadrinoRecipes::App.controllers :comments do
  
  get :new do
    @comment = Comment.new
  end

  post :create do
    binding.pry
    @comment = Comment.new(params[:comment])
    @comment.save
    redirect to url_for(:recipes, :show, :id => params[:comment][:recipe_id])
  end

  delete :destroy do

  end
end
