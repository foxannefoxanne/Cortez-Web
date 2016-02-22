class Video < ActiveRecord::Base
	belongs_to :pin

	has_attached_file :vid_clip,
    	:path => ":rails_root/public/video/:id/:filename",
   	    :url  => "/video/:id/:filename"

    do_not_validate_attachment_file_type :vid_clip

end
