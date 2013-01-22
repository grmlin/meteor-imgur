imgur = {} if imgur is undefined

imgur.Response = do ->
  class Response

    constructor : (apiResponse, error) ->
      @_response = apiResponse
      @_error = error
      
      Object.defineProperties @,
        _responseData :
          value : apiResponse.data ?  null
          
    get         : (key) ->
      @data[key] ? null


  Object.defineProperties Response::,
    isSuccess :
      get : ->
        @_responseData and @_responseData.success
    status    :
      get : ->
        @_responseData?.status
    data      :
      get : ->
        if @_responseData
          @_responseData.data
        else
          @_response
    error     :
      get : ->
        #console.log @data
        
        if @_responseData 
          """
          IMGUR API ERROR (see https://api.imgur.com/errorhandling)
            STATUS: #{@status}
            REQUEST: #{@get('request')}
            METHOD: #{@get('method')}
            MESSAGE #{@get('error')}
            PARAMETERS: #{@get('parameters')}
          """
        else
          """
          IMGUR
            A fatal error occured loading data via HTTP
            #{@_error}
          """

  return Response