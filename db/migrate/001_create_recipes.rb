class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :title
      t.string :img_url
      t.text :description
      t.integer :cook_time
      t.integer :prep_time
      t.integer :serves
      t.integer :chef_id
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
