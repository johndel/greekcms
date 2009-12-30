class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.string :title
      t.string :meta_description
      t.string :meta_keywords
      t.string :permalink
      t.text :description
      t.integer :position
      t.boolean :active
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
