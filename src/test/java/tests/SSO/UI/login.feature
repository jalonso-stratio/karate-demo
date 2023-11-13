@tests
@tests_sso
@tests_sso_ui
@tests_sso_ui_login
    
Feature: Login test

Scenario: Login with invalid login credentials
    //Given driver sso_url
    Given driver sso_url
    And input('#input-username', 'jalonso')
    And input('#input-password', 'wrongpassword')
    When click('#login-page-login-button')
    And match driver.text('.right-title') contains 'Login error'

Scenario: Login with valid login credentials
    //Given driver sso_url
    Given driver sso_url
    And input('#input-username', 'jalonso')
    And input('#input-password', 'Stratio-123')
    When click('#login-page-login-button')
    Then match driver.title == 'Stratio'
    And match driver.text('.right-title') contains 'Help Center'

Scenario: Token malformed
    
Scenario: Token missing

Scenario: Forgot password

Scenario: Logout

Scenario: Check objects into login page


