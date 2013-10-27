class AddBioToChefs < ActiveRecord::Migration
  def self.up
    change_table :chefs do |t|
      t.text :bio
    end
  end

  def self.down
    change_table :chefs do |t|
      t.remove :bio
    end
  end
end
