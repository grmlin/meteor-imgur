/*global Package*/
Package.describe({
    summary : "imgur, a free image hoster for non commercial projects."
});

Package.on_use(function (api) {
    api.use('underscore', 'server');
    api.use('coffeescript', 'server');
    
    api.add_files(['src/Response.coffee'], 'server');
    api.add_files(['src/Api.coffee'], 'server');
});