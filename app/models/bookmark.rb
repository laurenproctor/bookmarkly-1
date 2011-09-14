require 'bitly'
class Bookmark < ActiveRecord::Base
  
  include Parser


  
  validates :url, :url => true
  validates :site_id, :presence => { :message => "Could not auto create the site for this reason" }
  
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
    get_author
    get_title
  end
 
  def get_tinyurl
    # use bit.ly to shorten things
    bitly = Bitly.new('davegriffiths', 'R_3646b5f251975cfce52e3aa3e593230f')
    u = bitly.shorten(self.url)
    self.tinyurl = u.short_url
  rescue BitlyError
    self.tinyurl = ""
  end
  
  def get_author
    # get meta
  end
  
  def get_title
     # get meta
  end
  
  def get_desc
     # get meta
  end
  
  
end
