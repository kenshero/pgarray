class AddAttachmentAvatarToUsers < ActiveRecord::Migration
  def self.up
    change_table :docs do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :docs, :pdf
  end
end
