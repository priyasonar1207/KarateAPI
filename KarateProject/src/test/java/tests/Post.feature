Feature: Post API Demo

  Background: 
    * url 'http://localhost:8080'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')
    * def requestBody = read('request1.json')

  #simple POST request without background
  Scenario: Post demo 1
    Given url 'http://localhost:8080/addPatient'
    And request {"patient_name":"Ankit","city":"Bhopal","age":23,"doctor_name":"Poonam","base_fee" : 500,"prescription_fee" : 2100,"discount_in_percent":10,"pt_mobile_number" : "9039122349"}
    When method POST
    Then status 202
    And print 'response is :' , response
    And print 'response status is :' , responseStatus
    And print 'response time is :' , responseTime
    And print 'response header is :' , responseHeaders
    And match $.id == "Bhopal23"

  #POST request with background
  Scenario: Post demo 2
    Given path '/addPatient'
    And request {"patient_name":"Ankita","city":"Pune","age":37,"doctor_name":"Rohan","base_fee" : 500,"prescription_fee" : 1700,"discount_in_percent":10,"pt_mobile_number" : "9039296249"}
    When method POST
    Then status 202
    And print 'response is :' , response

  #POST request with assertions
  Scenario: Post demo 3
    Given path '/addPatient'
    And request {"patient_name":"Avni","city":"Nasik","age":32,"doctor_name":"Rohan","base_fee" : 500,"prescription_fee" : 1700,"discount_in_percent":10,"pt_mobile_number" : "9039296249"}
    When method POST
    Then status 202
    And print 'response is :' , response
    And match response == {"msg": "Patient is Already exist","id": "Nasik32","patient_name": "#ignore"}

  #POST request with read response from json file
  Scenario: Post demo 4
    Given path '/addPatient'
    And request {"patient_name":"Avni","city":"Mumbai","age":29,"doctor_name":"Rohan","base_fee" : 500,"prescription_fee" : 1700,"discount_in_percent":10,"pt_mobile_number" : "9039296249"}
    When method POST
    Then status 202
    And print 'response is :' , response
    And match response == expectedOutput
    And match $ == expectedOutput

  #POST request with read request body from json file
  Scenario: Post demo 5
    Given path '/addPatient'
    And request requestBody
    When method POST
    Then status 202
    And print 'response is :' , response

  #POST request with read request body from json file and set value different
  Scenario: Post demo 6
    Given path '/addPatient'
    And set requestBody.prescription_fee = 2000
    And print requestBody
    And request requestBody
    When method POST
    Then status 202
    Then print 'response is :' , response
