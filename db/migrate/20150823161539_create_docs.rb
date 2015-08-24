class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :name
      t.string :words, array: true, default: []

      t.timestamps null: false
    end
  end
end
