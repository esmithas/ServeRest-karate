@searchUser @users @smoke
Feature: API de Usuarios - Listar usuarios - ServeRest
  Como administrador del sistema
  Quiero poder listar todos los usuarios a través de la API
  Para administrar la base de datos de usuarios

  Background:
    * url baseUrl
    * def schemaPath = 'classpath:schemas/users/user-schema-karate.json'
    * def generators = call read('classpath:helpers/generators.js')
    * def userData = generators.generateUserData()

  @searchUser @positive
  Scenario: GET /usuarios/{_id} - Buscar usuario por ID
    Given path '/usuarios'
    And request userData
    When method post
    Then status 201
    And def userId = response._id
    Given path '/usuarios/' + userId
    When method get
    Then status 200
    And match response == read(schemaPath)
    And match response._id == userId
    And match response.nome == userData.nome
    And match response.email == userData.email

  @searchUser @negative
  Scenario: GET /usuarios/{_id} - Buscar usuario con ID inexistente
    Given path '/usuarios/ID00INEXISTENTE1'
    When method get
    Then status 400
    And match response contains { message: 'Usuário não encontrado' }