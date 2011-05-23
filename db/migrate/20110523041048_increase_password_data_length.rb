class IncreasePasswordDataLength < ActiveRecord::Migration
  def self.up
    change_column :users, :password_salt, :string, :limit => 60, :null => false
    change_column :users, :password_hash, :string, :limit => 60, :null => false
  end

  def self.down
    change_column :users, :password_salt, :string, :limit => 50, :null => false
    change_column :users, :password_hash, :string, :limit => 50, :null => false
  end
end
