Feature: Initialize Repository
  To be able to create a new repository
  As a user
  I want to be able to initialize a repository

  Scenario: Initialize current directory
    When I execute the init command in the current directory
    Then the repository should be initialized

  Scenario: Initialize other directory
    When I execute the init command with another directory as argument
    Then the repository should be initialized
