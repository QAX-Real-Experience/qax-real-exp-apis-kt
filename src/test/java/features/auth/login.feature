Feature: Autenticación de usuario Aprendiz

  Background:
    * url baseUrl
    * def password = '12345678'
    * def payload = { email: 'aprendiz1001@qaxpert.com', password: '12345678' }
  

  Scenario: CP01 - Login exitoso
    Given path '/auth/v1/token'
    And param grant_type = 'password'
    And request payload
    When method POST
    Then status 200
    And match response contains 
    """
    {
      "access_token": "#string",
      "token_type": "bearer",
      "expires_in": "#number",
      "refresh_token": "#string",
      "user": "#object"
    }
    """

  Scenario Outline: CP<cp> - Login con <descripcion>
    * set payload.<campo> = <valor>

    Given path '/auth/v1/token'
    And param grant_type = 'password'
    And request payload
    When method POST
    Then status <statusEsperado>
    And match response.error_code == '<errorEsperado>'
    And match response.msg == '<MensajeError>'


    Examples:

    | cp | descripcion              | campo    | valor                | statusEsperado | errorEsperado        | MensajeError              |
    | 02 | Usuario no registrado    | email    | 'tomilissa@test.com' | 400            | invalid_credentials  | Invalid login credentials |
    | 03 | Email formato inválido   | email    | 'tomilissa'          | 400            | invalid_credentials  | Invalid login credentials |
    | 04 | Email vacío              | email    | ''                   | 400            | validation_failed    | missing email or phone    |
    | 05 | Contraseña inválida      | password | '1234567'            | 400            | invalid_credentials  | Invalid login credentials |
    | 06 | Contraseña vacía         | password | ''                   | 400            | invalid_credentials  | Invalid login credentials |
    
  Scenario: CP07 - Login con campo email ausente
    * remove payload.email

    Given path '/auth/v1/token'
    And param grant_type = 'password'
    And request payload
    When method POST
    Then status 400
    And match response.error_code == 'validation_failed'
    And match response.msg == 'missing email or phone'

  Scenario: CP08 - Login con campo contraseña ausente
    * remove payload.password
    
    Given path '/auth/v1/token'
    And param grant_type = 'password'
    And request payload
    When method POST
    Then status 400
    And match response.error_code == 'invalid_credentials'
    And match response.msg == 'Invalid login credentials'


  


