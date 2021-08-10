Feature: Get API config file Demo

  Background: 
    * url baseUrl
    * header Accept = 'application/json'

  #simple GET request without background from config file
  Scenario: Get demo 1
    Given path '/Indore20'
    When method GET
    Then status 200
    And print 'response is :' , response
