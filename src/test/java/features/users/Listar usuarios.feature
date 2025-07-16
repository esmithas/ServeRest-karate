@getUser @users @smoke
Feature: API de Usuarios - Listar usuarios - ServeRest
  Como administrador del sistema
  Quiero poder listar todos los usuarios a través de la API
  Para administrar la base de datos de usuarios

  Background:
    * url baseUrl

  @getUser @positive
  Scenario: GET /usuarios - Listar todos los usuarios
    Given path '/usuarios'
    When method get
    Then status 200
    And match response contains { quantidade: '#number' }
    And match response contains { usuarios: '#array' }
    And match response.usuarios[*] contains { _id: '#string', nome: '#string', email: '#string', password: '#string', administrador: '#string' }