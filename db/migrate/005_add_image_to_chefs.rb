class AddImageToChefs < ActiveRecord::Migration
  def self.up
    change_table :chefs do |t|
      t.string :img_url
    end
  end

  def self.down
    change_table :chefs do |t|
      t.remove :img_url
    end
  end
end
