require 'addressable/uri'
require 'bitly'
require 'open-uri'
require 'nokogiri'

class Bookmark < ActiveRecord::Base 
  acts_as_taggable
  acts_as_taggable_on :tags 
  validates :url, :url => true
  validates :site_id, :presence => { :message => "could not be auto generated for this reason" } 
  belongs_to :site 
  attr_protected :site_id 
  before_validation :find_or_create_site, :smart_parse_url, :downcase_url
  before_save :auto_retrieve_fields    
  default_scope order('url ASC')

  private
  
  def downcase_url
    self.url.downcase!
  end
  
  def find_or_create_site
    self.site = Site.find_or_create_by_domain(domain)
  end
  
  # try to smart fix the url before hitting the validator
  def smart_parse_url
     self.url = Addressable::URI.heuristic_parse(self.url).to_s
  end
   
  def domain
      Addressable::URI.heuristic_parse(self.url).host
  end

  def auto_retrieve_fields
    get_tinyurl
    get_last_modified
    get_title
  end
 
  def get_tinyurl  
     Bitly.use_api_version_3
     #I would put the username/apikey in a yaml config if it was a live app
       bitly = Bitly.new('davegriffiths', 'R_3646b5f251975cfce52e3aa3e593230f')
       u = bitly.shorten(self.url)
       self.tinyurl = u.short_url
     rescue SocketError
       self.tinyurl = "-"
  end

  def get_title
     site = Nokogiri::HTML(open(url))
     self.title = site.at_css("title").text
     rescue
      self.title = "-"
  end
  
  # could get all the meta data but will leave that as further work
  def get_last_modified
     h = open(self.url)
     self.last_modified = h.last_modified
    rescue
      self.last_modified = ""
  end
  
  
end
