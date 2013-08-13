class AddBirthdayToFoaf < ActiveRecord::Migration
  def change
    add_column :foafs, :birthday, :date
  end
end
