Feature: Signing up

  As a visitor
  I want to create an account (sign up)
  So I can use the app

  Scenario Outline: Unsuccessful signup
    Given I am on the signup page
    When I submit invalid "<username>" and/or "<password>"
    Then I should see an error message
      And I should see the signup form

    Scenarios: empty fields
      | username | password |
      |          |          |
      | ABCD     |          |
      |          | 123456   |

    Scenarios: too short
      | username | password |
      | A        | 12345    |
      | A        | 123456   |
      | AB       | 12345    |

  Scenario: Successful signup
    Given I am on the signup page
    When I submit valid signup information
    Then I should get logged in
      And I should see a signup success message

  Scenario: Impossible signup
    Given I am currently logged in
    When I visit the signup page
    Then I should not see it