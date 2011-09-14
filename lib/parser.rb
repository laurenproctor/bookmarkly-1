require "addressable/uri"

module Parser
  def url_to_domain(url)
      Addressable::URI.heuristic_parse(url).host
   end
   
   def url_to_uri(url)
     Addressable::URI.heuristic_parse(url).to_s
   end
end