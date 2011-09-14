class SitesController < ApplicationController
  respond_to :html
  
  def index
    @site = Site.all()
    
    respond_with @site
  end
  
end