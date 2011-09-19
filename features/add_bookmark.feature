Feature: Save new bookmarks
	As a web user 
	I want to save my fav web pages
	So I can view them later
	
	Scenario: New
	Given I am on the new bookmark page
	When I fill in "bookmark_url" with "http://davegriffiths.me"
	And I fill in "bookmark_tag_list" with "personal, blog"
	Then show me the page
	And I press "Add Bookmark"
	Then I should see "Bookmark Added!"