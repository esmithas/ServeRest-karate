function fn() {
  return {
    generateUserData: function() {
      var timestamp = new Date().getTime();
      var random = Math.floor(Math.random() * 10000);
      return {
        nome: 'Usuario Test ' + timestamp,
        email: 'usuario.' + timestamp + '.' + random + '@example.com',
        password: 'test123',
        administrador: 'true'
      };
    }
  };
}