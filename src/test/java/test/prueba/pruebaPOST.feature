@tag

Feature: Prueba

Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    
# Simple Post scenario
Scenario: Post demo 1
    Given url 'https://reqres.in/api/users'
    And request { "name": "Raghav", "job": "leader"}
    When method post
    Then status 201

# Post scenario with Background
Scenario: Post demo 2
    Given path '/users'
    And request { "name": "Raghav", "job": "leader"}
    When method post
    Then status 201

# Post with response assertion
Scenario: Post demo 3
    Given path '/users'
    And request { "name": "Raghav", "job": "leader"}
    When method post
    Then status 201
    And match response == {"name": "Raghav", "job": "leader","id": "#string","createdAt": "#ignore"}
