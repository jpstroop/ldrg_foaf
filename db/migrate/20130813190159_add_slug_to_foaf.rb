class AddSlugToFoaf < ActiveRecord::Migration
  def change
    add_column :foafs, :slug, :string
  end
end
