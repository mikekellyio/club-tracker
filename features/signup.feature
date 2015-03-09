Feature: As a user I need to be able to sign up to use the application

Scenario: Successful signup
  When I go to the signup page
  And I enter my name as "Mike"
  And I enter my email
  And I enter my password as "password"
  And I enter my password confirmation as "password"
  And I submit my registration
  Then I should have an account with a name of "Mike"
