class CreateRecipesTags < ActiveRecord::Migration
  def self.up
    create_table :recipes_tags do |t|
      t.integer :recipe_id
      t.integer :tag_id
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes_tags
  end
end
