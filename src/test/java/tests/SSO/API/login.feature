@tests
@tests_sso
@tests_sso_api
@tests_sso_api_login
    
Feature: Login

Background:
    * header Content-Type = 'application/json'

#Scenario: Login with invalid login credentials
#    Given path 'login'
#    And request {"username":"jalonso","password":"wrongpassword"}
#    When method POST
#    Then status 401
#    And match $.error == "Unauthorized"
#    And match $.message == "Authentication failed: token is invalid"
#    And match $.path == "/login"


#Scenario: Login with valid login credentials
#    Given path 'login'
#    And request {"username":"jalonso","password":"Stratio-123"}
#    When method POST
#    Then status 200
#    And print responseTime
#    And assert responseTime < 1500

Scenario: Get token
    Given url baseURL 
    And path 'auth'
    And request {"token":"1033255"}
    When method POST
    Then status 204

Scenario: Token missing
    Given url baseURL 
    And path 'user/validate'
    And request {"token":"wrongtoken","mail":"jalonso@stratio.com"}
    When method POST
    Then status 401
    And match $.message == "Token not found"
    
Scenario: Token malformed

Scenario: PasswordExpire

Scenario: Logout
    


