class CreateRecipeTags < ActiveRecord::Migration
  def self.up
    create_table :recipe_tags do |t|
      t.integer :recipe_id
      t.integer :tag_id
      t.timestamps
    end
  end

  def self.down
    drop_table :recipe_tags
  end
end
