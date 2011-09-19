Given /^an existing bookmark with the following data:$/ do |table|
   @bookmark = Bookmark.create!(table.rows_hash)
end

Then /^a site should have been generated for "([^"]*)"$/ do |id|
  site = Site.find(id)
  site != nil
end

Then /^a bookmark should have been generated for "([^"]*)"$/ do |url|
  bookmark = Bookmark.find_by_url(url)
  bookmark != nil
end