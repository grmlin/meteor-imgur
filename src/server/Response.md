# Class: imgur.Response

Class wrapping the response objects of imgur api calls. Read [the imgur documentation](http://api.imgur.com/models) 
to learn, which response types exist.   
*Normally, it's not necessary to create instances of this this class manually, as [imgur.Api](Api.html) returns 
them already.*

**this class is available in the server, only!**

## new imgur.Response(apiResponse, error)

* `apiResponse` Object - the response object returned by the [Meteor.http](http://docs.meteor.com/#meteor_http) 
methods.
* `error` Error - the error parameter of the Meteor.http method callbacks

## response.data:Object

returns the complete data object of the api call. If the call wasn't successful the original responseObject will be 
returned.

## response.error:String
 
returns an error message, if there was any. `null` otherwise

## response.get(key):*

* key String - the key of the returned data from the imgur api call, you're interested in

The available data depends on the type of api call. For a complete list of all available calls read [the imgur 
documentation](http://api.imgur.com/models)
### Example

    api = new imgur.Api("secretkey");
    api.getImageInformation('imagehash', function(err, response){
        console.log("image has type " + response.get('type'));
    });
    
## response.isSuccess:Boolean

returns true, if the imgur api call was successful

## response.status:Number

returns the http status of the api call
  
