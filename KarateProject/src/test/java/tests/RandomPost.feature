Feature: API test for patient api

  Background: 
    Given url 'http://localhost:8080'
    * def random_stringCity =
      """
      function(c) {  
       var city = ""; 
       var characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";  
       for (var i = 0; i < c; i++)  
         city += characters.charAt(Math.floor(Math.random() * characters.length));
       return city;  
      }  
      """
    * def random_stringAge =
      """
      function(a) {  
       var age = ""; 
       var num = "1234567890";
          for (var i = 0; i < a; i++)  
         age += num.charAt(Math.floor(Math.random() * num.length));
        return age;  
      }  
      """
    * def patientCity = random_stringCity(5)
    * print 'Patient city is:' , patientCity
    * def patientAge = random_stringAge(2)
    * print 'Patient age is:' , patientAge
    * def patientId = patientCity + patientAge
    * print 'Patient Id is:' , patientId

  Scenario: Post request for random id
    Given path '/addPatient'
    And request {"patient_name":"Aniket","city":"#(patientCity)","age":"#(patientAge)","doctor_name":"Sakshi","base_fee" : 500,"prescription_fee" : 2200,"discount_in_percent":10,"pt_mobile_number" : "8889122349"}
    When method POST
    Then status 201
    And print 'response is :' , response
    And print 'response status is :' , responseStatus
    And match response == {"msg": "Success Patient is Added","id": "#(patientId)"}
