@deleteUser @users @smoke
Feature: API de Usuarios - Listar usuarios - ServeRest
  Como administrador del sistema
  Quiero poder listar todos los usuarios a través de la API
  Para administrar la base de datos de usuarios

  Background:
    * url baseUrl
    * def generators = call read('classpath:helpers/generators.js')
    * def userData = generators.generateUserData()

  @deleteUser @positive
  Scenario: DELETE /usuarios/{_id} - Eliminar usuario
    Given path '/usuarios'
    And request userData
    When method post
    Then status 201
    And def userId = response._id
    Given path '/usuarios/' + userId
    When method delete
    Then status 200
    And match response contains { message: 'Registro excluído com sucesso' }

  @deleteUser @negative
  Scenario: DELETE /usuarios/{_id} - Eliminar usuario inexistente
    Given path '/usuarios/ID_INEXISTENTE'
    When method delete
    Then status 200
    And match response contains { message: 'Nenhum registro excluído' }