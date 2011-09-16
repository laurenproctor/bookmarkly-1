class BookmarksController < ApplicationController
    respond_to :html
    
    def index
      if params[:site_id]
        @bookmark = site.bookmarks.find_all_by_site_id(params[:site_id])
        respond_with [site, @bookmark]
      elsif params[:search]
        @bookmark = Bookmark.search(params[:search])
        respond_with @bookmark
      else
        @bookmark = Bookmark.all
        respond_with @bookmark
      end
    end
    
    def show
       @bookmark = site.bookmarks.find(params[:id])      
       respond_with [site , @bookmark]
    end
   
   # normal create - as site needs to be autocreated so cant be accessed firsts
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