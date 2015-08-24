class AddDesciptionToDocs < ActiveRecord::Migration
  def change
    add_column :docs, :description, :text
  end
end
