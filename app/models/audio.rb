class Audio < ActiveRecord::Base
	belongs_to :pin

	has_attached_file :aud_clip,
    	:path => ":rails_root/public/audio/:id/:filename",
    	:url  => "/audio/:id/:filename"

    validates_attachment_content_type :aud_clip, :content_type => ['audio/mp3',]
end
