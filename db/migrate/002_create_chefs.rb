class CreateChefs < ActiveRecord::Migration
  def self.up
    create_table :chefs do |t|
      t.string :first_name
      t.string :last_name
      t.integer :michelin
      t.string :website
      t.timestamps
    end
  end

  def self.down
    drop_table :chefs
  end
end
