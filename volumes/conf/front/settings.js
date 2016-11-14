var configData = {
    'ENV': 'DEV',
    'APP_NAME': 'ISZ-ZAKUPKA-PLANNING',
    'APP_VERSION': '0.1',
    'CONFIG': {
        'PROD': {
            'AUTHENTICATION_SERVER_URL'                   : "http://auth.zakupki-mon-ca.ru",
            'CURRENT_SUB_SYSTEM_SERVER_URL'               : "http://planning.zakupki-mon-ca.ru",
            'BACKEND_SERVER_URL'                          : "http://app.zakupki-mon-ca.ru",
            'BACKEND_SUB_SERVER_URL'                      : "",
            'AUTHENTICATION_CLIENT_ID'                    : "31_3nr2ywvp7s4kg8c88s48ggokgscow44ogwg0o4k4sg4sokcoc8",
            'AUTHENTICATION_COOKIE_DOMAIN'                : ".gosbook.ru",
            'CURRENT_SUB_SYSTEM_MACHINE_NAME'             : "fp_planirovanie",
            'PLANNING_SUB_SYSTEM_URL'                     : "http://planning.zakupki-mon-ca.ru",
            'DOCUMENTS_SUB_SYSTEM_URL'                    : "http://planning.zakupki-mon-ca.ru",
            'PROCEDURES_SUB_SYSTEM_URL'                   : "http://procedures.zakupki-dev.online",
            'ACCEPTANCE_SUB_SYSTEM_URL'                   : "http://priemka.zakupki-dev.online",
            'STATS_SUB_SYSTEM_URL'                        : "http://arm.zakupki-mon-ca.ru"
        },
        'DEV': {
            'AUTHENTICATION_SERVER_URL'                   : "http://profile.isz.dev",
            'CURRENT_SUB_SYSTEM_SERVER_URL'               : "http://planning.isz.dev",
            'BACKEND_SERVER_URL'                          : "http://app.isz.dev",
            'BACKEND_SUB_SERVER_URL'                      : "http://profile.isz.dev",
            'AUTHENTICATION_CLIENT_ID'                    : "37_mbin3i49to0sk0ks0880wg8c4cc080wo0kos4c8go44cw8ssw",
            'AUTHENTICATION_COOKIE_DOMAIN'                : ".isz.dev",
            'CURRENT_SUB_SYSTEM_MACHINE_NAME'             : "fp_planirovanie",
            'PLANNING_SUB_SYSTEM_URL'                     : "http://planning.isz.dev",
            'DOCUMENTS_SUB_SYSTEM_URL'                    : "http://planning.isz.dev",
            'PROCEDURES_SUB_SYSTEM_URL'                   : "http://procedure.isz.dev",
            'ACCEPTANCE_SUB_SYSTEM_URL'                   : "http://acceptance.isz.dev",
            'STATS_SUB_SYSTEM_URL'                        : "http://arm.isz.dev"
        }
    }
};


var configModule = angular.module('config', []);
angular.forEach(configData, function(key, value) {
    configModule.constant(value, key);
});