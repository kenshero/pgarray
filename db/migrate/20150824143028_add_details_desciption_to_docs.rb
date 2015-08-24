class AddDetailsDesciptionToDocs < ActiveRecord::Migration
  def change
    add_column :docs, :author, :string
    add_column :docs, :year, :string
    add_column :docs, :publisher, :string
  end
end
