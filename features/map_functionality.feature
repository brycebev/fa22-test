Feature: see list of representatives of a county

  As an interested voter
  So that I can learn about my representatives
  I want to see the representatives of my county

Background: representatives in database

  | OCD ID | Representative Name | Representative Title |
  | 1      | Joseph R. Biden     | President of the United States |

Scenario: See representatives of a county
  Given I click on Wyoming
  When I click on Big Horn County
  Then I should see "Joseph R. Biden"