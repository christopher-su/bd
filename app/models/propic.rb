class Propic < ActiveRecord::Base
  belongs_to :project

  has_attached_file :photo,:styles => { :s => "200x150#"},
    :url => "/upfile/propic/:id:style:basename.:extension",
    :path => ":rails_root/public/upfile/propic/:id:style:basename.:extension"

  validates_attachment_size :photo, :less_than => 2.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png','image/pjpeg']

end
