PadrinoRecipes::App.controllers :chefs do

  layout :main

  get :new do
    @chef = Chef.new
    render '/chefs/new'
  end

  post :create do
    @chef = Chef.new(params[:chef])
    @chef.save
    redirect_to url_for(:chefs, :show, :id => @chef.id)
  end

  get :index do
    @chefs = Chef.all
    render '/chefs/index'
  end

  get :show, :with => :id do 
    @chef = Chef.find(params[:id])
    render '/chefs/show'
  end

  put :update, :with => :id do
    @chef = Chef.find(params[:id])
    @chef.update_attributes(params[:chef])
    redirect_to url_for(:chefs, :show, :id => @chef.id)
  end

  delete :destroy do
    
  end

end
