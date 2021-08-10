Feature: Put API Demo

  Background: 
    * url 'http://localhost:8080/updatePatient'
    * header Accept = 'application/json'

  #simple PUT request without background
  Scenario: Put demo 1
    Given url 'http://localhost:8080/updatePatient/Nagpur19'
    And request {"age":33,"city":"Lucknow","doctor_name":"Rohan","patient_name":"Anjali","fees_payable":"3000"}
    When method PUT
    Then status 200
    And print 'response is :' , response
    And print 'response status is :' , responseStatus
    And print 'response time is :' , responseTime

  #simple PUT request with background
  Scenario: Put demo 2
    Given path '/Nagpur19'
    And request {"age":33,"city":"Lucknow","doctor_name":"Rohan","patient_name":"Anjali","fees_payable":"3000"}
    When method PUT
    Then status 200
    And print 'response is :' , response

  #simple PUT request with assertions
  Scenario: Put demo 3
    Given path '/Nagpur19'
    And request {"age":33,"city":"Lucknow","doctor_name":"Rohan","patient_name":"Anjali","fees_payable":"3000"}
    When method PUT
    Then status 200
    And print 'response is :' , response
    And match $ == {"base_fee": "500","fees_payable": "3000","city": "#ignore","patient_name": "Anjali","prescription_fee": "9500","id": "#ignore","doctor_name": "Rohan","discount_in_percent": "10","age": "#ignore","pt_mobile_number": "9764943744"}
