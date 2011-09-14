class BookmarksController < ApplicationController
  respond_to :html
  
  def index
    @bookmark = site.bookmarks.all()
  end
  
  def new 
    @bookmark = site.bookmarks.new
    
    respond_with [site, @bookmark]
  end
  
  def create
    @bookmark = site.bookmarks.new(params[:bookmark])
    
    success = @bookmark.save
  
    respond_with [site, @bookmark] do |format|
          format.html {
             if success
                redirect_to(bookmark_path(@bookmark), :notice => 'Bookmark added')
              else
                  render 'new'
              end
          }
    end
  end
   
  def show
      @bookmark = site.bookmarks.find(params[:id])
  end
  
  private
  
  def site
    debugger
  
      self.Site = Site.find(params[:site_id])
      self.Site ||= Site.new(:name => get_domain(params[:url]))

  end
  
  # def site
  #    site = Site.find(params[:site_id])
  #    site ||= Site.new(:name => get_domain(params[:url]))
  #  end
  
  def get_domain(url)
    url
  end
  
  
  
  
end