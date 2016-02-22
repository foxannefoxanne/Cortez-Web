class AddAttachmentAudClipToAudios < ActiveRecord::Migration
  def self.up
    change_table :audios do |t|
      t.attachment :aud_clip
    end
  end

  def self.down
    remove_attachment :audios, :aud_clip
  end
end
