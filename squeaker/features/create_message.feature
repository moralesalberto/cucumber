Feature: Creating a message
  Scenario: A user goes to the New Message page
    Given there is a User
    When the User goes to the New Message page
    Then the new message form is presented to them with the notice "Enter your message"

  Scenario: A user enters a new message successfully
    Given there is a User
    And the new message form is presented to them with the notice "Enter your message"
    When the User enters message "This is my first message"
    And the User submits the message form with "This is my first message"
    Then the message should be created with "This is my first message"
    And the user should see the new message "This is my first message"
