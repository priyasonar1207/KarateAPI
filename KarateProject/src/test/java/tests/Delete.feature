Feature: Delete API Demo

  Background: 
    * url 'http://localhost:8080'
    * header Accept = 'application/json'

  #simple DELETE request without background
  Scenario: Delete demo 1
    Given url 'http://localhost:8080/deletePatient'
    And request {"id": "Mumbai24"}
    When method DELETE
    Then status 500
    And print 'response is :' , response
    And print 'response status is :' , responseStatus
    And print 'response time is :' , responseTime

  #simple DELETE request with background
  Scenario: Delete demo 2
    Given path '/deletePatient'
    And request {"id": "Nagpur19"}
    When method DELETE
    Then status 500
    And print 'response is :' , response
