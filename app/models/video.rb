class Video < ActiveRecord::Base
	belongs_to :pin

	has_attached_file :vid_clip,
    	:path => ":rails_root/public/video/:id/:filename",
   	    :url  => ":s3_domain_url",
   	    :s3_protocol => 'https'


    validates_attachment_content_type :vid_clip, :content_type => ['video/mp4',]

end
