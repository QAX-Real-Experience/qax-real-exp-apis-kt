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


  Scenario: CP02 - Registro con email duplicado

    Given path '/auth/v1/signup'
    And param grant_type = 'password'
    And request payload
    When method post
    Then status 422
    And match response.msg == 'User already registered'


  Scenario: CP03 - Registro sin contraseña

    Given path '/auth/v1/signup'
    And param grant_type = 'password'

    # Clonamos el payload y removemos el campo password
    * def invalidPayload = payload
    * remove invalidPayload.password

    And request invalidPayload
    When method post
    Then status 400
    And match response.msg == 'Signup requires a valid password'


   Scenario: CP04 - Registro sin email

    Given path '/auth/v1/signup'
    And param grant_type = 'password'

    # Clonamos el payload y removemos el campo email
    * def invalidPayload = payload
    * remove invalidPayload.email

    And request invalidPayload
    When method post
    Then status 422
    And match response.msg == 'Anonymous sign-ins are disabled'


   Scenario: CP05 - Registro con email inválido

    Given path '/auth/v1/signup'
    And param grant_type = 'password'

    # Clonamos el payload y asignamos un email inválido
    * def invalidPayload = payload
    * set invalidPayload.email = 'invalid-email-format'

    And request invalidPayload
    When method post
    Then status 400
    And match response.msg == 'Unable to validate email address: invalid format'