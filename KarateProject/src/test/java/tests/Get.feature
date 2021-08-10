Feature: Get API Demo

  Background: 
    * url 'http://localhost:8080/getPatient'
    * header Accept = 'application/json'

 #simple GET request without background
  Scenario: Get demo 1
    Given url 'http://localhost:8080/getPatient/Indore20'
    When method GET
    Then status 200
    And print 'response is :' , response

  #GET request with background
  Scenario: Get demo 2
    Given path '/Indore20'
    When method GET
    Then status 200
    And print 'response is :' , response
    And match $.id == "Indore20"
    And print 'response status is :' , responseStatus
    And print 'response time is :' , responseTime
    And print 'response header is :' , responseHeaders

  #GET request with query parameter
  Scenario: Get demo 3
    Given url 'http://localhost:8080/getPatient/doctor_name?doctor_name=Ashish'
    When method GET
    Then status 200
    And print 'response is :' , response

  #GET request with path, params
  Scenario: Get demo 4
    Given path '/doctor_name'
    And param doctor_name = 'Ashish'
    When method GET
    Then status 200
    And print 'response is :' , response

  #GET with assertions
  Scenario: Get demo 5
    Given path '/doctor_name'
    And param doctor_name = 'Ashish'
    When method GET
    Then status 200
    And print 'response is :' , response
  
    
