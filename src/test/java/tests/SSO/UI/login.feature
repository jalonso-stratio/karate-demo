@tests
@tests_sso
@tests_sso_ui
@tests_sso_ui_login
    
Feature: Login test

Background:
    * call read 'classpath:data/SSO/UI/login_objects.json'
    
Scenario: Login with invalid login credentials
    Given driver sso_url
    And input(login.input_username, 'jalonso')
    And input(login.input_password, 'wrongpassword')
    When click(login.icon_eye_on)
    And click(login.icon_eye_off)
    And clear(login.input_password)
    Then match driver.title == 'Stratio'
    And match driver.text(login.copyright_gray) contains "Stratio Big Data Inc. All Rights Reserved."
    And match driver.text(login.copyright_link) contains "stratio.com"

Scenario: Login with valid login credentials
    * call read 'classpath:data/SSO/UI/authentication_objects.json'

    Given driver sso_url
    And input(login.input_username, 'jalonso')
    And input(login.input_password, 'Stratio-123')
    When click(login.button)
    * waitForUrl('/authentication')
    Then match driver.text(login.title) contains 'We have sent you an email with an authentication code'
    And match driver.text(authentication.under_title) contains 'Please, check the email and confirm your account by entering the authorization code sent to'
    And match driver.text(authentication.resend_code) contains "Didn't get a verification code?"
    And match driver.text(login.button) contains "Log in"
    When input(authentication.inputs[0],'0')
    And input(authentication.inputs[1],'1')
    And input(authentication.inputs[2],'2')
    And input(authentication.inputs[3],'3')
    And input(authentication.inputs[4],'4')
    And input(authentication.inputs[5],'5')
    And input(authentication.inputs[6],'6')
    And click(login.button)
    
Scenario: Forgot password
    Given driver sso_url
    And input(login.input_username, 'jalonso')
    And input(login.input_password, 'Stratio-123')
    When click(login.forgot_password)
    Then match driver.text(login.title) contains 'Forgot password?'
    And match driver.text(login.under_forgot_password) contains "Enter your account email and we'll send you a link to reset your password."
    * assert exists(login.input_email)