function fn() {
    var env = karate.env || 'dev';
    karate.log('karate.env system property was:', env);

    var config = {
        baseUrl: 'https://serverest.dev',
        timeout: 10000,
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    };

    // Configuraciones específicas por ambiente
    if (env === 'dev') {
        config.baseUrl = 'https://serverest.dev';
    } else if (env === 'test') {
        config.baseUrl = 'https://serverest.dev';
    } else if (env === 'prod') {
        config.baseUrl = 'https://serverest.dev';
    }

    karate.log('Final baseUrl:', config.baseUrl);
    return config;
}