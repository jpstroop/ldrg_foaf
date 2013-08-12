class RemoveInterestRefFromFoaf < ActiveRecord::Migration
  def change
    remove_reference :foafs, :interests, index: true
  end
end
