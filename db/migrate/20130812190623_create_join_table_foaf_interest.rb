class CreateJoinTableFoafInterest < ActiveRecord::Migration
  def change
    create_join_table :foafs, :interests do |t|
      # t.index [:foaf_id, :interest_id]
      # t.index [:interest_id, :foaf_id]
    end
  end
end
