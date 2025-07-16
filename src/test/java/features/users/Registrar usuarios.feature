@createUser @users @smoke
Feature: API de Usuarios - Listar usuarios - ServeRest
  Como administrador del sistema
  Quiero poder listar todos los usuarios a través de la API
  Para administrar la base de datos de usuarios

  Background:
    * url baseUrl
    * def generators = call read('classpath:helpers/generators.js')
    * def userData = generators.generateUserData()

  @createUser @positive
  Scenario: POST /usuarios - Registrar nuevo usuario con datos válidos
    Given path '/usuarios'
    And request userData
    When method post
    Then status 201
    And match response contains { message: 'Cadastro realizado com sucesso' }
    And match response contains { _id: '#string' }
    And def userId = response._id

  @createUser @negative
  Scenario: POST /usuarios - Intentar registrar usuario con email duplicado
    Given path '/usuarios'
    And request userData
    When method post
    Then status 201
    Given path '/usuarios'
    And request userData
    When method post
    Then status 400
    And match response contains { message: 'Este email já está sendo usado' }