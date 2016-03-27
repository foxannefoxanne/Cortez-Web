class Picture < ActiveRecord::Base
  belongs_to :pin

  has_attached_file :image,
	:s3_protocol => 'https',
    :path => ":rails_root/public/images/:id/:filename",
    :url  => ":s3_domain_url"

    validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/gif', 'image/jpeg', 'image/png']
end
