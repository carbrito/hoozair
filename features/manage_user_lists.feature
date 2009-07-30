Feature: Manage user_lists
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new user_list
    Given I am on the new user_list page
    And I press "Create"

  Scenario: Delete user_list
    Given the following user_lists:
      ||
      ||
      ||
      ||
      ||
    When I delete the 3rd user_list
    Then I should see the following user_lists:
      ||
      ||
      ||
      ||
