class RemoveFoafRefFromInterest < ActiveRecord::Migration
  def change
    remove_reference :interests, :foafs, index: true
  end
end
