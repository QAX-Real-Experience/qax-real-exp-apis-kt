Feature: Helper para generar payload dinámico para nuevo usuario

  Scenario: Crear payload dinámico para un nuevo usuario
    * def utils = call read('classpath:utils/utils.js')
    * def payload = read('classpath:data/user-data.json')
    * set payload.email = utils.generarEmail()
    * set payload.password = utils.generarPassword()
    * set payload.fullname = utils.generarFullName()
    * set payload.country = utils.generarCountry()
    * set payload.wp = utils.generarWp()
