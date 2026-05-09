Feature: Registro de usuario Aprendiz

  Background:
    * url baseUrl
    * def utils = call read('classpath:utils/utils.js')
    * def userData = callonce read('classpath:features/auth/helpers/build-payload-user.feature')
    * def payload = userData.payload

    * def idFormat = '#regex ' + uuidRegex
    * def userSchema = { id: '#(idFormat)', role: '#string', email: '#(payload.email)' }
  

@create
  Scenario: CP01 - Crear usuario exitosamente
    Given path '/auth/v1/signup'
    And param grant_type = 'password'
    And request payload
    When method post
    Then status 200
    And match response contains 
    """
    {
      "access_token": "#string",
      "expires_in": "#number",
    }
    """
     And match response.user contains userSchema