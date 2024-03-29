class Advpic < ActiveRecord::Base
  attr_accessible :photo,:desc,:serv_type
  
  has_attached_file :photo,:styles => { :big => "940x450>" ,:small => "90x60>" },
    :url => "/upfile/advpic/:id:style:basename.:extension",
    :path => ":rails_root/public/upfile/advpic/:id:style:basename.:extension"

  validates_attachment_size :photo, :less_than => 2.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png','image/pjpeg']
  
end
