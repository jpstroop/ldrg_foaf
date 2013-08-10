class CreateFoafs < ActiveRecord::Migration
  def change
    create_table :foafs do |t|
      t.string :ident
      t.string :name
      t.string :work
      t.datetime :birthday

      t.timestamps
    end
    add_index :foafs, :ident, unique: true
  end
end
