class Category < ActiveRecord::Base
  attr_accessible :name,:desc
  has_many :projects
end
