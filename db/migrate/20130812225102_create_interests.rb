class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :label
      t.string :uri

      t.timestamps
    end
    add_index :interests, :label, unique: true
  end
end
