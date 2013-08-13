class CreateFoafsInterestsJoin < ActiveRecord::Migration
  def self.up
    create_table :foafs_interests, id: false do |t|
      t.integer 'foaf_id'
      t.integer 'interest_id'
    end
    add_index :foafs_interests, ['foaf_id','interest_id']
  end


  def self.down
    drop_table :foafs_interests
  end
end
