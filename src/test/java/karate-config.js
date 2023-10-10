function fn() {
    var config = {
        name: 'Stratio',
        baseURL: 'https://reqres.in/api'
    };

    var env = karate.env;
    karate.log('Given Env: ', env);
    if (env == 'dev') {
        config.baseURL = 'https://reqres.in/dev/api'
    } else if (env == 'prod') {
        config.baseURL = 'https://reqres.in/prod/api'
    } else if (env == 'local') {
        config.baseURL = 'https://reqres.in/api'
    }

    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    return config;
}