class Audio < ActiveRecord::Base
	belongs_to :pin

	has_attached_file :aud_clip,
    	:path => ":rails_root/public/audio/:id/:filename",
    	:s3_protocol => 'https',
  	    :url  => ":s3_domain_url"

    validates_attachment_content_type :aud_clip, :content_type => ['audio/mp3',]
end
