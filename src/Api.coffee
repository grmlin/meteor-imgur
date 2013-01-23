imgur = {} if imgur is undefined

imgur.Api = do ->
  GET    = "GET"
  POST   = "POST"
  PUT    = "PUT"
  DELETE = "DELETE"

  class Api
    @DEFAULT_OPTIONS :
      IMAGE_URL   : 'https://api.imgur.com/3/image/'

    constructor : (apiKey, options = {}) ->
      Object.defineProperties @,
        _options       :
          value : _.defaults(options, Api.DEFAULT_OPTIONS)
        _apiKey        :
          value : apiKey
        _defaultHeader :
          value :
            headers :
              Authorization : "Client-ID #{apiKey}"

    _processRequest  : (method, url, options, callback, ctx) ->
      throw new Error('callback function expected') if typeof callback isnt 'function'
      throw new Error('method not supported') unless _.contains([GET, POST, PUT, DELETE], method)

      Meteor.http.call method, url, options, (error, responseObject) ->
        response = new imgur.Response responseObject, error

        if response.isSuccess
          callback.call ctx, null, response
        else
          callback.call ctx, new Error(response.error), responseObject


    # INSTANCE MEMBERS
    delete : (deleteHash, callback, ctx = null) ->
      @_processRequest DELETE, "#{@_options.IMAGE_URL}#{deleteHash}", @_defaultHeader, callback, ctx

    getImageInformation : (hash, callback, ctx = null) ->
      @_processRequest GET, "#{@_options.IMAGE_URL}#{hash}", @_defaultHeader, callback, ctx

    uploadFile : (file) ->

    uploadUrl  : (url, callback, ctx = null) ->
      postParameters =
        params :
          'image' : url
          'type'  : 'URL'
      @_processRequest POST, @_options.IMAGE_URL, _.extend(postParameters, @_defaultHeader), callback, ctx


    