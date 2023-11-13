@tests
@tests_sso
@tests_sso_api
@tests_sso_api_login
    
Feature: Login

Background:
    * url 'https://login-sso-pre.int.stratio.com/'
    * header Content-Type = 'application/json'

Scenario Outline: <user_login> Login
    Given path 'login'
    And request {"username":<user_login>,"password":<password_login>}
    When method POST
    Then status 200
    And print responseTime
    And assert responseTime < 1500
    
    Examples:
    |   user_login      | password_login    |
    #|   "mruizmartinez" | "Stratio-123"     |
    #|   "lhermida"      | "Stratio-123"     |
    |   "jalonso"       | "Stratio-123"     |


Scenario: Token missing
    Given path 'user/validate'
    And request {"token":"3YfElbZ8LlWhebhO","mail":"jalonso@stratio.com"}
    When method POST
    Then status 401
    And match $.message == "Token not found"
    
Scenario: Token malformed

Scenario: PasswordExpire

Scenario: Logout


