imgur = {} if imgur is undefined

imgur.Api = do ->
  'use strict'

  DEFAULT_OPTIONS =
    IMAGE_INFO_URL   : 'https://api.imgur.com/3/image/'
    IMAGE_UPLOAD_URL : "https://api.imgur.com/3/image/"

  processResponse = (error, responseObject, callback, ctx) ->
    response = new imgur.Response responseObject, error
    if response.isSuccess
      callback.call ctx, null, response
    else
      callback.call ctx, new Error(response.error), responseObject

  class Api
    constructor      : (apiKey, options = {}) ->
      Object.defineProperties @,
        _options       :
          value : _.defaults(options, DEFAULT_OPTIONS)
        _apiKey        :
          value : apiKey
        _defaultHeader :
          value :
            headers :
              Authorization : "Client-ID #{apiKey}"
    # STATIC MEMBERS
    @getResponseData : (response) ->
      # INSTANCE MEMBERS
    delete           : (imageHash) ->

    uploadFile       : (file) ->

    uploadUrl        : (imageUrl, callback, ctx = null) ->
      throw new Error('callback function expected') if typeof callback isnt 'function'

      postParameters =
        params :
          'image' : imageUrl
          'type'  : 'URL'

      Meteor.http.post @_options.IMAGE_UPLOAD_URL, _.extend(postParameters, @_defaultHeader), (error, responseObject) =>
        processResponse error, responseObject, callback, ctx

    getImageInformation : (imageHash, callback, ctx = null) ->
      throw new Error('callback function expected') if typeof callback isnt 'function'

      Meteor.http.get "#{@_options.IMAGE_INFO_URL}#{imageHash}", @_defaultHeader, (error, responseObject) ->
        processResponse error, responseObject, callback, ctx