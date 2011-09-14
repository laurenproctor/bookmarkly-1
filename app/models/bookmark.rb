
class Bookmark < ActiveRecord::Base
  
  include Url
  
  validates :url, :url => true
  validates :site_id, :presence => { :message => "could not be auto generated for this reason" }
  
  belongs_to :site
  
  attr_protected :site_id
  
  before_validation :find_or_create_site, :smart_parse_url
  
  before_save :auto_retrieve_fields  
    
  default_scope order('url DESC')

  
  private
  
  def find_or_create_site
    self.site = Site.find_or_create_by_domain(url_to_domain(self.url))
  end
  
  # try to smart fix the url before hitting the validator
  def smart_parse_url
     self.url = url_to_uri(self.url)
  end
  
  def auto_retrieve_fields
    get_tinyurl
    get_last_modified
    get_title
  end
 
  def get_tinyurl
    self.tinyurl = shorten(self.url)
  end

  def get_title
     self.title = get_html_title(self.url)
  end
  
  # could save all the meta data but will leave that as further work
  def get_last_modified
     h = open(self.url)
     self.last_modified = h.last_modified
    rescue
      self.last_modified = ""
  end
  
  
end
