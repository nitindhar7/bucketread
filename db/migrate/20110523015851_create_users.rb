class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name, :null => false, :limit => 50
      t.string :last_name, :null => false, :limit => 50
      t.string :email, :null => false, :limit => 100
      t.string :password_hash, :null => false, :limit => 50
      t.string :password_salt, :null => false, :limit => 50

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
