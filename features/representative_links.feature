Feature: Access representative home pages anywhere their name apears

  As a site user
  So that I can easily access information about a representative
  I want to see a link to their information page anyplace their name apears

Background: Representative information has been accessed from the external API
  Given I am on the search page
  And I fill in "address" with "berkeley"
  And I press "commit"

Scenario: I am accessing a representative from the search page.
  Given I am on the search page
  And I fill in "address" with "berkeley"
  And I press "commit"
  When I follow "Joseph R. Biden"
  Then I should be on the info page for "Joseph R. Biden"

@load-seed-data @US49
Scenario: I am accessing a representative from a news article.
  Given I am on the news page for "Gavin Newsom" article "Newsom Orders Second Shutdown of Restaurants and Indoor Businesses amid COVID-19"
  Then I should see "The new order affects 19 California counties with a surging number of coronavirus cases"
  When I follow "Gavin Newsom"
  Then I should be on the info page for "Gavin Newsom"