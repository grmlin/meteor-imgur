/*global Package*/
Package.describe({
    summary : "imgur, a free image hoster for non commercial projects."
});

Package.on_use(function (api) {
    api.use('underscore', 'server');
    api.use('coffeescript', 'server');
    
    api.add_files(['server/Response.coffee'], 'server');
    api.add_files(['server/Api.coffee'], 'server');
});