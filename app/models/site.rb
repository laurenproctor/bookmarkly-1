class Site < ActiveRecord::Base
  # extend GenericSearch
  
  validates :domain, :presence => true  
  has_many :bookmarks
  
  default_scope order('domain ASC')
  
  
   def self.search(search)
      if search
        search.downcase!           
        where("domain LIKE ? OR bookmarks.url LIKE ? OR bookmarks.title LIKE ? ", "%#{search}%","%#{search}%","%#{search}%").includes(:bookmarks)
      else
        find(:all)
      end
    end
    
    
  
end
