class AddInterestRefToFoaf < ActiveRecord::Migration
  def change
    add_reference :foafs, :interests, index: true
  end
end
