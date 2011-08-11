class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :content_type, :null => false, :limit => 50
      t.string :filename, :null => false, :limit => 100
      t.binary :binary_data, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
