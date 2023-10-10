@tag validacion
@javi
@javimas
@javimasmas

Feature: Prueba

Background:
    * url 'https://reqres.in/api'
    * header Acept = 'application/json'

Scenario: Escenario con la propia request
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseTime

Scenario: Escenario modificando la request con el background
    Given path 'users?page=2'
    When method GET
    Then status 200
    And print response

Scenario: Escenario modificando la request con el background, clean
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

Scenario: Escenario comprobando la respuesta
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match $.data[1].id == 8
    And match $.data[3].last_name == 'Fields'