# Class: imgur.Api

provides access to the imgur api.

**this class is available in the server, only!**

## imgur.Api.DEFAULT_OPTIONS
Default options used for imgur api http calls

## new imgur.Api(apiKey, [options])

* `apiKey` String - your personal imgur [api key](http://api.imgur.com/oauth2/addclient).
* `options` Object - a custom options object that will be merged with the default options 
[imgur.Api.DEFAULT_OPTIONS](#imgur.Api.DEFAULT_OPTIONS), Optional

## api.delete(hash)

* `hash` String - the id/hash of the image that should be deleted

## api.getImageInformation(hash, callback, [ctx = null])

* `hash` String - the id/hash of the image you want to get the information for
* `callback` Function - callback function
* `ctx` Object - the context of the callback function, Optional

`callback` gets two arguments (error, [imgur.Response](Response.html)). 


### Example

```js
  api = new imgur.Api("secretkey");
  api.getImageInformation('imagehash', function(err, response){
    if (err) {
      console.log(err);
    } else {
      console.log("image has type " + response.get('type'));
    }
  });
    
```


## api.uploadFile(file)

TODO

## api.uploadUrl(url, callback, [ctx = null])

* `url` String - image url you want to upload to imgur
* `callback` Function - callback function
* `ctx` Object - the context of the callback function, Optional

`callback` gets two arguments (error, [imgur.Response](Response.html)). 

### Example


      api = new imgur.Api("secretkey");
      api.uploadUrl("http://foo.bar/funny.gif", function(err, response){
        if (err) {
          console.log(err);
        } else {
          console.log("image uploaded. ID " + response.get('id'));
        }
      });


