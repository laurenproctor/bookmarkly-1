Given /^an existing bookmark with the following data:$/ do |table|
   @bookmark = Bookmark.create!(table.rows_hash)
end

