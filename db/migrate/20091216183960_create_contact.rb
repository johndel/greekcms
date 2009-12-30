class CreateContact < ActiveRecord::Migration
  def self.up
    create_table :contact do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :contact
  end
end
