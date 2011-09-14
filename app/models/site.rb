class Site < ActiveRecord::Base
  
  validates :domain, :presence => true
  
  has_many :bookmarks
  
  default_scope order('domain DESC')
    
  
end
