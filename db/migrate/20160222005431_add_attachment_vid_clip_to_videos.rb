class AddAttachmentVidClipToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :vid_clip
    end
  end

  def self.down
    remove_attachment :videos, :vid_clip
  end
end
