Feature: Access representative home pages anywhere their name apears

  As a site user
  So that I can easily access information about a representative
  I want to see a link to their information page anyplace their name apears

Background: representatives have been added to database
 

Scenario: I am accessing a representative from the search paage.
  Given I am on the representative search page
  And I fill in "address" with "berkeley"
  And I press "commit"
  When I follow "Joseph R. Biden"
  Then I should be on the info page for "Joseph R. Biden"