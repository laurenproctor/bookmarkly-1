require 'addressable/uri'
require 'bitly'
require 'open-uri'
require 'nokogiri'

module Url
  def url_to_domain(url)
      Addressable::URI.heuristic_parse(url).host
   end
   
   def url_to_uri(url)
     Addressable::URI.heuristic_parse(url).to_s
   end
   
   # use bit.ly to shorten things
   def shorten(url)
     # would put this in a config if it was a live app
     Bitly.use_api_version_3
       bitly = Bitly.new('davegriffiths', 'R_3646b5f251975cfce52e3aa3e593230f')
       u = bitly.shorten(self.url)
       u.short_url
     rescue BitlyError
       ""
   end
   
   def get_html_title(url)
      site = Nokogiri::HTML(open(url))
      site.at_css("title").text
    rescue
      ""
   end
end