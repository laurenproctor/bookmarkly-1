class Tag < ActiveRecord::Base
  
  validates :name, presence => true
  validates :bookmark_id, presence => true
  
end
