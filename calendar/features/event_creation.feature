Feature: Calendar event creation
  This feature enables an authenticated user to create an event in the calendar
  
  Scenario: Attempt to create an event where the end_date is earlier than the start_date
    Given user is logged into the calendar
    When user enters an event
    But the event end_date is earlier than the start_date
    When user submits the form for calendar creation
    Then display an error message advising user that the end_time needs to be later than the start_time

  Scenario Outline: Attempt to create an event with incomplete data
    Given user is logged into the calendar
    When the user enters an event
    But the data entered is incomplete
    When the user submits the form for calendar creation
    Then display an error message advising user of the missing entries for event creation 

    Examples:
      | StartDate           | EndDate             | Title             | 
      |                     | 2015-01-01 03:00:00 | Dr Appt in Reston | 
      | 2015-01-01 13:00:00 |                     | Music lessons     |
      | 2015-01-01 13:00:00 | 2015-01-01 14:00:00 |                   |


  Scenario: Create an event successfully
    Given user is logged into the calendar
    When the user enters an event
    And the title, description, start_date, end_date are filled out
    When the user submits the form for calendar creation
    Then create the event
    And display a successful event creation notice

  Scenario: Attempt to create an event when the user is not logged in
    Given user is not logged into the calendar
    When the user attempts to enter an event
    Then redirect them to the login page

