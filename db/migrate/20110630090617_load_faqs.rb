require 'active_record/fixtures'

class LoadFaqs < ActiveRecord::Migration
  def self.up
    Fixtures.create_fixtures('test/fixtures', File.basename("faqs.yml", '.*'))
  end

  def self.down
  end
end
