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
      "expires_in": "#number? _ % 1 == 0"
    }
    """
     And match response.user contains userSchema


  Scenario: CP02 - Registro con email duplicado

    Given path '/auth/v1/signup'
    And param grant_type = 'password'
    And request payload
    When method post
    Then status 422
    And match response.error_code == 'user_already_exists'
    And match response.msg == 'User already registered'


  Scenario: CP03 - Registro sin contraseña

    Given path '/auth/v1/signup'
    And param grant_type = 'password'

    # Clonamos el payload y removemos el campo password
    * copy invalidPayload = payload
    * remove invalidPayload.password

    And request invalidPayload
    When method post
    Then status 400
    And match response.msg == 'Signup requires a valid password'


   Scenario: CP04 - Registro sin email

    Given path '/auth/v1/signup'
    And param grant_type = 'password'

    # Clonamos el payload y removemos el campo email
    * copy invalidPayload = payload
    * remove invalidPayload.email

    And request invalidPayload
    When method post
    Then status 422
    And match response.msg == 'Anonymous sign-ins are disabled'


   Scenario: CP05 - Registro con email inválido

    Given path '/auth/v1/signup'
    And param grant_type = 'password'

    # Clonamos el payload y asignamos un email inválido
    * copy invalidPayload = payload
    * set invalidPayload.email = 'invalid-email-format'

    And request invalidPayload
    When method post
    Then status 400
    And match response.error_code == 'validation_failed'
    And match response.msg == 'Unable to validate email address: invalid format'

   Scenario: CP06 - Fortaleza de Contraseña (Límite Inferior)

    Given path '/auth/v1/signup'
    And param grant_type = 'password'

    # Clonamos el payload y asignamos una contraseña débil (menos de 6 caracteres)
    * copy invalidPayload = payload
    * set invalidPayload.password = 'tl123'

    And request invalidPayload
    When method post
    Then status 422
    And match response.error_code == 'weak_password'
    And match response.msg == 'Password should be at least 6 characters.'
    And match response.weak_password.reasons == ['length']


   Scenario: CP07 - Registro sin campos optativos (Nombre, País, WhatsApp)
    
    # Generamos un nuevo set de datos solo para este escenario
    * def newUserData = call read('classpath:features/auth/helpers/build-payload-user.feature')
    * def newPayload = newUserData.payload

    # 2. Eliminamos los campos que están sueltos en la raíz
    * remove newPayload.fullname
    * remove newPayload.country
    * remove newPayload.wp

    # 3. Seteamos el objeto data con valores vacíos
    * set newPayload.data = { "fullname": "", "country": "", "wp": "" }


    Given path '/auth/v1/signup'
    And param grant_type = 'password'
    And request newPayload
    When method post
    Then status 200
    And match response.user.user_metadata contains { "fullname": "", "country": "", "wp": "" }
