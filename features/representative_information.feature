Feature: display information for representatives on their home pages

  As a site user
  So that I can gather information about a representative
  I want to see their name, OCD ID, office, contact, address (street, city, state, zip), political party, and a
photo.

Background: Representative information has been accessed from the external API
  Given I am on the search page
  And I fill in "address" with "berkeley"
  And I press "commit"
 
  

Scenario: I am looking for the address of a canidate
  Given I am on the info page for "Joseph R. Biden"
  Then I should see "1600 Pennsylvania Avenue Northwest"
  And I should see "Washington"
  And I should see "DC"
  And I should see "20500"

Scenario: I am looking for the political party of a canidate
  Given I am on the info page for "Joseph R. Biden"
  Then I should see "Democratic Party"

Scenario: I am looking for a photo of the canidate
  Given I am on the info page for "Dianne Feinstein"
  Then I should see "http://bioguide.congress.gov/bioguide/photo/F/F000062.jpg"
  