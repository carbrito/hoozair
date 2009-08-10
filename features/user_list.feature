Feature:  User API

So that I can be interact with other visitors
As a user
I want to be able to list users 

Scenario: View other users on my current page
  Given the following users view 'home.aspx'
    | name      |
    | Megatron  |
    | Soundwave |
  When I request users viewing 'home.aspx'
  Then the following users are returned
    | name      |
    | Megatron  |
    | Soundwave |