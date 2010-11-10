@refinerycms @news-items @news-items-manage
Feature: Manage News Items
  In order to have news bulletins on my website
  As an administrator
  I want to create and manage news items

  Background:
    Given I am a logged in refinery user
    And I have no news items

  Scenario: News Items List
    Given I have news items titled Home, About
    When I go to the list of news items
    Then I should see "Home"
    And I should see "About"

  Scenario: Create Valid News Item
    When I go to the list of news items
    And I follow "Add News Item"
    And I fill in "Title" with "News Items are a fun way to share what's going on"
    And I fill in "Content" with "It really is the most exciting thing you could hear about today."
    And I press "Save"
    Then I should see "'News Items are a fun way to share what's going on' was successfully added."
    And I should have 1 news item

  Scenario: Create Invalid News Item (without title)
    When I go to the list of news items
    And I follow "Add News Item"
    And I fill in "Content" with "But you won't ever see this published"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 news items

  Scenario: Create Invalid News Item (without content)
    When I go to the list of news items
    And I follow "Add News Item"
    And I fill in "Title" with "Good luck ever seeing this title"
    And I press "Save"
    Then I should see "Content can't be blank"
    And I should have 0 news items


  Scenario: Create Duplicate News Item
    Given I only have news items titled Home, About
    When I go to the list of news items
    And I follow "Add News Item"
    And I fill in "Title" with "About"
    And I press "Save"
    Then I should have 2 news items

  Scenario: Delete News Item
    Given I only have a news item titled "test"
    When I go to the list of news items
    And I follow "Remove this news item forever"
    Then I should see "'test' was successfully removed."
    And I should have 0 news items
