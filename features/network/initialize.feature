Feature: Initialize Custom Network
  To be able to create a new custom network
  As a user
  I want to be able to initialize a custom network

  Scenario: Initialize current directory
    When I execute the init command in the current directory
    Then the custom network should be initialized

  Scenario: Initialize other directory
    When I execute the init command with another directory as argument
    Then the custom network should be initialized
