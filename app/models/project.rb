class Project < ActiveRecord::Base
  attr_accessible :propics_attributes,:name,:desc,:category_id
  belongs_to :category
  has_many :propics,:dependent => :destroy
  accepts_nested_attributes_for :propics, :allow_destroy => true
  
end
