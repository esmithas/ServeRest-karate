@editUser @users @smoke
Feature: API de Usuarios - Listar usuarios - ServeRest
  Como administrador del sistema
  Quiero poder listar todos los usuarios a través de la API
  Para administrar la base de datos de usuarios

  Background:
    * url baseUrl
    * def generators = call read('classpath:helpers/generators.js')
    * def userData = generators.generateUserData()


  @editUser @positive
  Scenario: PUT /usuarios/{_id} - Actualizar usuario existente
    Given path '/usuarios'
    And request userData
    When method post
    Then status 201
    And def userId = response._id

    Given path '/usuarios/' + userId
    * def userData = generators.generateUserData()
    * def newEmail = userData.email
    And request
    """
    {
      "nome": "Usuario Actualizado",
      "email": "#(newEmail)",
      "password": "nueva123",
      "administrador": "false"
    }
    """
    When method put
    Then status 200
    And match response contains { message: 'Registro alterado com sucesso' }

  @editUser @negative
  Scenario: PUT /usuarios/{_id} - Actualizar usuario inexistente
    Given path '/usuarios/ID_INEXISTENTE'
    And request
    """
    {
      "nome": "Usuario Test",
      "email": "test@example.com",
      "password": "test123",
      "administrador": "true"
    }
    """
    When method put
    Then status 400
    And match response contains { message: 'Este email já está sendo usado' }