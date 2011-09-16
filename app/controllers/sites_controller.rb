class SitesController < ApplicationController
  respond_to :html
  
  def index
    @site = Site.search(params[:search])
    respond_with @site
  end
  
end