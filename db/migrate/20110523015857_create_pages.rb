class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :url, :limit => 200, :null => false
      t.integer :status, :default => 0, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
