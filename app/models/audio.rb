class Audio < ActiveRecord::Base
	belongs_to :pin

	has_attached_file :aud_clip,
    	:path => ":rails_root/public/audio/:id/:filename",
    	:url  => "/audio/:id/:filename"

    do_not_validate_attachment_file_type :aud_clip
end
