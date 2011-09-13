class Bookmark < ActiveRecord::Base
  
  validates :url, :presence => true
  validates :site_id, :presence => true
  
end
