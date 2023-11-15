function fn() {
    var config = {
        name: 'Stratio',
    };

    var env = karate.env;
    if (!env) {
        env = 'dev';
    }

    karate.log('Given Env: ', env);
    if (env == 'dev') {
        baseURL = 'https://login-sso-pre.int.stratio.com/'
        config.sso_url = "https://sso-pre.int.stratio.com/login"
    }

    var browser = karate.properties['browser'] || 'chrome';
    karate.log('the browser set is: ' + browser + ', default: "chrome"');
  
    var grid_url = karate.properties['grid_url'] || false;
    karate.log('the grid url set is: ' + grid_url + ', default: false');

    if (browser == 'chrome') {
        if (!grid_url) {
           karate.configure('driver', { type: 'chrome', screenshotOnFailure: false, userDataDir: null, addOptions: ["--remote-allow-origins=*"] });
           karate.log("Selected Chrome");
        } else {
           karate.configure('driver', { type: 'chrome', start: false, webDriverUrl: grid_url });
           karate.log("Selected Chrome in grid");
        }
    } else if (browser == 'firefox') {
        if (!grid_url) {
            karate.configure('driver', { type: 'geckodriver' });
            karate.log("Selected Firefox");
        } else {
            karate.configure('driver', { type: 'geckodriver', screenshotOnFailure: false, start: false, webDriverUrl: grid_url });
            karate.log("Selected Firefox in grid");
        }
    } 

    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);

    return config;
}