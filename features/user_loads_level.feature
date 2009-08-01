Feature: RPuzz starts game

  As a player
  I want to start a game
  So that I can find all the diamonds
  
  Scenario: start game
    Given I am not yet playing
    When I start a new game using the octothorpe level
    Then I should see the text "Welcome to JPuzz"
    And I should see the octothorpe level 
