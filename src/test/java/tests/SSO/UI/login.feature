@tests
@tests_sso
@tests_sso_ui
@tests_sso_ui_login
    
Feature: Login test

Scenario: Login with invalid login credentials
    Given driver sso_url
    And input('#input-username', 'jalonso')
    And input('#input-password', 'wrongpassword')
    When click('.icon-eye')
    When click('.icon-eye-off')
    And clear('#input-password')

Scenario: Login with valid login credentials
    Given driver sso_url
    And input('#input-username', 'jalonso')
    And input('#input-password', 'Stratio-123')
    When click('#login-page-login-button')
    Then match driver.title == 'Stratio'
    * waitForUrl('/authentication')
    And match driver.text('.login-title') contains 'We have sent you an email with an authentication code'
    And match driver.text('.text-secundary') contains 'Please, check the email and confirm your account by entering the authorization code sent to'
    And match driver.text('.copyright-link-verification') contains "Didn't get a verification code?"
    And match driver.text('#login-page-login-button') contains "Log in"
    And match driver.text('.copyright-gray') contains "Stratio Big Data Inc. All Rights Reserved."
    And match driver.text('.copyright-link') contains "stratio.com"
    
Scenario: Forgot password
    Given driver sso_url
    And input('#input-username', 'jalonso')
    And input('#input-password', 'Stratio-123')
    When click('#login-page-login-button')
    Then match driver.title == 'Stratio'
    * waitForUrl('/authentication')
    And match driver.text('.login-title') contains 'We have sent you an email with an authentication code'
    And match driver.text('.text-secundary') contains 'Please, check the email and confirm your account by entering the authorization code sent to'
    And match driver.text('.copyright-link-verification') contains "Didn't get a verification code?"
    And match driver.text('#login-page-login-button') contains "Log in"


