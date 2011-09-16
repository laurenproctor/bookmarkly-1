module GenericSearch
    
  def search(search)
    if search
      search.downcase!
      where(build_query(search))
    else
      find(:all)
    end
  end
  
  private 
  
  def build_query(search)
    query = []
    query << build_sql
    query << build_terms(search)    
    query.flatten!
  end   
  
  def build_sql
    query = ""
    @column_names.each do |col|     
        query += col + " LIKE ? OR "  unless default_column?(col)
     end  
    query[0...-4]  
  end
  
   def build_terms(search)
     conditions = []
     count = @column_names.count - 3
     (0...count).each do
        conditions << "%#{search}%"
      end     
      conditions
    end
    
     # don't search the default columns
    def default_column?(col)
       if col == "id" || col ==  "created_at" || col ==  "updated_at" then
          return true
       end
       false
    end
    
 
end