Given /^existing bookmarks with the following data:$/ do |table|
   @bookmark = Bookmark.create!(table.hashes)
end

When /^I search with "([^"]*)"$/ do |search|
  site = Site.search(search)
  site != nil
end

