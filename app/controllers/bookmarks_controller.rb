class BookmarksController < ApplicationController
    respond_to :html
    
    # nested show
    def index
      if params[:site_id]
        @bookmark = site.bookmarks.find_all_by_site_id(params[:site_id])
      else
        @bookmark = Bookmark.all
      end
      
      respond_with [site, @bookmark]
    end
    
    def show
       @bookmark = site.bookmarks.find(params[:id])      
       respond_with [site , @bookmark]
    end
   
   # normal create - as site needs to be autocreated
    def new
      @bookmark = Bookmark.new 
      respond_with @bookmark
    end

    def create   
      @bookmark = Bookmark.new(params[:bookmark])

      if @bookmark.save
         redirect_to(site_bookmarks_path(@bookmark.site_id), :notice => 'Bookmark Added!')
      else
        render :action => "new"
      end
    end
    
    private 
    
    def site  
       Site.find(params[:site_id])
    end
end