AJS iTunesAPI
=============

AJSiTunesAPI is a simple, asynchronous Cocoa API controller and object for searching the iTunes Search API on either Mac OSX or iOS projects.

This library is a work-in-progress, but current features should work as expected. Support for iTunes lookups from artist ID is omitted, and planned.

### Requirements

AJSITunesAPI 0.2.0 uses the latest version of AFNetworking, and as a result is compatible only with project supporting iOS7, or OSX 10.9 Mavericks.

### Documentation

For a rundown of the type of results to expect, source documentation of the API can be found here: http://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html

Results are parsed to Cocoa objects, with properties for most of the returned data. Check the header files for data types and properties supported.

Installation
============

Installation is super easy, using Cocoapods. Just add the `pod 'AJSITunesAPI', :git => 'https://github.com/andysmart/AJS-iTunes-API'` to your `Podfile` and run `pod install`.

Usage
=====

AJSITunesAPI is now fully block based, and much simpler as a result. Use one of the two convenience methods on `AJSITunesClient`, and receive an `NSArray` of `AJSITunesResult` objects.

	```objective-c
    AJSITunesClient *client = [AJSITunesClient sharedClient];
    [client searchMedia:@"batman" completion:^(NSArray *results, NSError *error) {
    		NSLog(@"Finished with results: %@", results);
    }];
    ```

Or, if you need a bit more control:

	```objective-c
	AJSITunesClient *client = [AJSITunesClient sharedClient];
	[client searchMediaWithType:AJSITunesMediaTypeMovie
	  keywords:@"batman"
	   country:@"US"
		 limit:10
	completion:(NSArray *results, NSError *error) {
		NSLog(@"Finished with results: %@", results);
	}];
	```

License
============

Standard MIT deal, see LICENSE for details.
