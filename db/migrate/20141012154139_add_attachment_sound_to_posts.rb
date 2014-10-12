class AddAttachmentSoundToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :sound
    end
  end

  def self.down
    remove_attachment :posts, :sound
  end
end
