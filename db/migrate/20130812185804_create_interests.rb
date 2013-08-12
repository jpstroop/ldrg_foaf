class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :label
      t.string :uri
      t.references :foaf, index: true

      t.timestamps
    end
  end
end
