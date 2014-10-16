class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields, id: false do |t|
      t.column :id, "int PRIMARY KEY"
      t.text :ground
      t.text :backbuild
      t.text :forebuild

      t.timestamps
    end
  end
end
