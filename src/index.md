# meteor-imgur

A meteor / meteorite smart package providing easy access to the [imgur api](http://api.imgur.com/). 

> The package isn't finished yet. The methods available should work, but I did not implement all of imgur's available
 api endpoints at this point in time.
 
## Installation

First, you need to get an imgur api key [here](http://api.imgur.com/oauth2/addclient).

### Atmosphere  

* Go to [https://atmosphere.meteor.com/](https://atmosphere.meteor.com/) and follow the instructions
* Call `> mrt add imgur` in the meteor projects root 

### Manually

* Download the meteor project from github
* Download and add the `imgur` package to the packages folder of meteor
* run the meteor script from the folder you checked the github repo out into, not the locally installed  one and add 
it there

## Usage

    api = new imgur.Api("secretkey");
    api.getImageInformation('imagehash', onInfo);
    api.uploadUrl("http://foo.bar/funny.gif", onUpload);
