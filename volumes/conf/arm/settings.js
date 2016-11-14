var configData = {
    'ENV': 'PROD',
    'APP_NAME': 'ISZ ARM',
    'APP_VERSION': '0.1',
    'CONFIG': {
        'PROD': {
            'APP_AUTH'              : "http://auth.isz.dev",
            'APP_URI'               : "http://arm.isz.dev",
            'APP_API_SERVER'        : "http://application.isz.dev",
            'APP_OAUTH_CLIENT_ID'   : "28_1j18zb5x72sk4c8wkkgwgo48w8w4gg8wck0w4ww08g4wwk8wkg",
            'APP_COOKIE_DOMAIN'     : ".isz.dev",
            'APP_SUB_SYSTEM'        : "fp_arm"
        },
        'DEV': {
            'APP_AUTH'              : "http://auth.isz.dev",
            'APP_URI'               : "http://arm.isz.dev",
            'APP_API_SERVER'        : "http://application.isz.dev",
            'APP_OAUTH_CLIENT_ID'   : "28_1j18zb5x72sk4c8wkkgwgo48w8w4gg8wck0w4ww08g4wwk8wkg",
            'APP_COOKIE_DOMAIN'     : ".isz.dev",
            'APP_SUB_SYSTEM'        : "fp_arm"
        }
    }
}

var configModule = angular.module('config', []);
angular.forEach(configData, function(key, value) {
    configModule.constant(value, key);
});