Feature: Search a site/bookmark
  I want to search to find a bookmark
  So I can speed up finding the link I want

  Background: 
     Given existing bookmarks with the following data:
        |url|tag_list|
        |http://www.msn.com|bill gates, blog|
        |http://davegriffiths.me|personal, site|
        |http://www.alphasights.com||
  
  Scenario: Search by bookmark title
    Given I am on the sites page
    And I fill in "search" with "freelance"
    And I press "search"
    Then I should see "davegriffiths.me" within "li.bookmark a"
     
   Scenario: Search by site domain
     Given I am on the sites page
     And I fill in "search" with "sn.co"
     And I press "search"
    Then I should see "www.msn.com" within "li.bookmark a"
    