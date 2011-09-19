Feature: Save new bookmarks
	As a web user 
	I want to save my fav web pages
	So I can view them later
	
  Background:
     Given an existing bookmark with the following data:
        |url|http://davegriffiths.me|
        |tag_list|personal,blog|
    
     Scenario: Add a bookmark
       Given I am on the new bookmark page
       When I fill in "bookmark_url" with "http://www.msn.me"
       And I fill in "bookmark_tag_list" with "microsoft, site"
       And I press "Add Bookmark"
       Then I should see "Bookmark Added!"
     
   
   Scenario: Check site data was created
       Then a site should have been generated for "1"
       
     Scenario: Check bookmark data was created
         Then a bookmark should have been generated for "http://davegriffiths.me"
   
     Scenario: View a site
       When I go to the sites page
       Then I should see "davegriffiths.me" within "li.bookmark a"
       
     Scenario: View a bookmark
       When I go to the site bookmark page for "http://davegriffiths.me"
       Then I should see "http://davegriffiths.me" within "div.bookmark ul:first-child"
       Then I should see "personal, blog" within "div.bookmark  ul:last-child"
  
   Scenario: View a shortend bookmark
        When I go to the site bookmark page for "http://davegriffiths.me"
        Then show me the page
        Then I should not see "-" within "div.bookmark  ul li:eq(2)"
   
     Scenario: View a titled bookmark
       When I go to the site bookmark page for "http://davegriffiths.me" 
       Then I should not see "-" within "div.bookmark  ul li:eq(3)"
 
