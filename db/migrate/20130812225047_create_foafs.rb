class CreateFoafs < ActiveRecord::Migration
  def change
    create_table :foafs do |t|
      t.string :name
      t.string :work

      t.timestamps
    end
  end
end
