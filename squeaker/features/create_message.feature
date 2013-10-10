Feature: Creating a message

  Scenario: A new user form is presented to the user
    Given there is a User
    And the user goes to the New Message page
    Then the new message form is presented to them with the notice "Enter your message"

  Scenario: A user enters a new message successfully
    Given there is a User
    And the new message form is presented to them with the notice "Enter your message"
    When the User enters message "This is my first message"
    And the User submits the new message form
    Then a new message should be created with "This is my first message"
    And the user should be shown a new page with "This is my first message"
