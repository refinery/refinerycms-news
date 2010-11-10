@refinerycms @news-items @news-items-visit @visit-news-items
Feature: Visit News Items
  In order to view the content on this website
  As a visitor
  I want to view news items

  Background:
    Given A Refinery user exists
    And I have a page titled "Home" with a custom url "/"
    And I have a page titled "News" with a custom url "/news"
    Given I only have a news item titled "Extra - Read all about it"
    And I have a news item titled "Unpublished News Item"
    And the news item titled "Unpublished News Item" is not published

  @menu
  Scenario: News appears in menu
    When I go to the home page
    Then I should see "Home"
    And I should see "News"

  @show
  Scenario: Show News Item
    When I go to the news item titled "Extra - Read all about it"
    Then I should see "Home"
    And I should see "Extra - Read all about it"
    And I should see "News" within ".selected"
    And I should not see "Unpublished News Item"
