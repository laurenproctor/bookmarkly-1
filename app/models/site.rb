class Site < ActiveRecord::Base
  
  validates :domain, :prensence => true
  
end
