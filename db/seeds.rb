Chef.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
Step.destroy_all

@gordon = Chef.create(
    :first_name => "Gordon",
    :last_name => "Ramsey",
    :michelin => 16,
    :website => "www.gordonswearsatfood.com"
  )

@nigella = Chef.create(
  :first_name => "Nigella",
  :last_name => "Lawson",
  :website => "www.nigellapoutsatfood.com"
  )

@heston = Chef.create(
  :first_name => "Heston",
  :last_name => "Blumenthal",
  :michelin => 3
  )

2.times do 
  recipe = Recipe.new(
    :title => "Beans on Toast",
    :description => "lightly broiled beans in a tomato sauce laid on a bed of flame-scorched farmhouse bloomer",
    :img_url => "http://girlalive.com/food/images/beans_on_toast430x300.jpg",
    :cook_time => 5,
    :prep_time => 2,
    :serves => 1,
    :chef_id => @gordon.id,
    )  
  5.times do
    recipe.ingredients << Ingredient.new(:ingredient => Faker::Lorem.words(10).join(" "))
    recipe.steps << Step.new(:step => Faker::Lorem.words(10).join(" "))
  end
  recipe.save
end

2.times do 
  recipe = Recipe.new(
    :title => "Bangers and Mash",
    :description => "Hand made finest free range pork and organic apple sausages served with organic potatoes creamed with roast garlic and shallots",
    :img_url => "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQBln3IV00rod36j6LdhDQDDmisNiC7kkbWemiwT5tPg4fBJp2fOQ",
    :cook_time => 20,
    :prep_time => 15,
    :serves => 4,
    :chef_id => @nigella.id,
    )
  5.times do
    recipe.ingredients << Ingredient.new(:ingredient => Faker::Lorem.words(10).join(" "))
    recipe.steps << Step.new(:step => Faker::Lorem.words(10).join(" "))
  end
  recipe.save
end

2.times do 
  recipe = Recipe.new(
    :title => "Burger and Chips",
    :description => "Finest steak minced and flame seared in a floury farmhouse bap, served with crisp fried potato chunks",
    :img_url => "http://goodtoknow.media.ipcdigital.co.uk/111/000008e59/cdc8_orh100000w614/Slimming-Worlds-burger-and-chips.jpg",
    :cook_time => 30,
    :prep_time => 30,
    :serves => 2,
    :chef_id => @heston.id
    )
  5.times do
    recipe.ingredients << Ingredient.new(:ingredient => Faker::Lorem.words(10).join(" "))
    recipe.steps << Step.new(:step => Faker::Lorem.words(10).join(" "))
  end
  recipe.save
end
