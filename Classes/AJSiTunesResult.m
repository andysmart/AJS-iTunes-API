/*
 * Copyright (c) 2011, Andy Smart. All rights reserved.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the Andy Smart nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY ANDY SMART ''AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL ANDY SMART BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "AJSiTunesResult.h"
#import "NSDictionary+AJSAdditions.h"
#import "ISO8601DateFormatter.h"

@implementation AJSiTunesResult
@synthesize itemID = _itemID;
@synthesize title = _title;
@synthesize releaseDate = _releaseDate;
@synthesize imageURL = _imageURL;
@synthesize tbnImageURL = _tbnImageURL;
@synthesize artistName = _artistName;
@synthesize previewURL = _previewURL;
@synthesize viewURL = _viewURL;
@synthesize mediaType = _mediaType;
@synthesize collectionName = _collectionName;
@synthesize genreName = _genreName;
@synthesize objectType = _objectType;
@synthesize itemDescription = _itemDescription;
@synthesize artistID = _artistID;
@synthesize trackCount = _trackCount;
@synthesize trackNumber = _trackNumber;
@synthesize duration = _duration;

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {

        //Parse the dictionary
        //Because of the nature of iTunes results, 
        //not all params may be present
        
        if ([dict clean_objectForKey:@"trackId"]) {
            self.itemID = [[dict clean_objectForKey:@"trackId"] intValue];
        }
        
        if ([dict clean_objectForKey:@"artistId"]) {
            self.artistID = [[dict clean_objectForKey:@"artistId"] intValue];
        }
        
        if ([dict clean_objectForKey:@"trackCount"]) {
            self.trackCount = [[dict clean_objectForKey:@"trackCount"] intValue];
        }
        
        if ([dict clean_objectForKey:@"trackNumber"]) {
            self.trackNumber = [[dict clean_objectForKey:@"trackNumber"] intValue];
        }
        
        self.title = [dict clean_objectForKey:@"trackName"];
        self.artistName = [dict clean_objectForKey:@"artistName"];
        self.genreName = [dict clean_objectForKey:@"primaryGenreName"];
        self.collectionName = [dict clean_objectForKey:@"collectionName"];
        self.objectType = [dict clean_objectForKey:@"kind"];
        
        //Attempt to get long description, then short, then nil if none
        
        if ([dict clean_objectForKey:@"longDescription"] &&
            [[dict clean_objectForKey:@"longDescription"] length]) {
            
            self.itemDescription = [dict clean_objectForKey:@"longDescription"];
        }
        
        else if ([dict clean_objectForKey:@"shortDescription"] &&
                 [[dict clean_objectForKey:@"shortDescription"] length]) {
            
            self.itemDescription = [dict clean_objectForKey:@"shortDescription"];
        }
        
        //URLs
        
        if ([dict clean_objectForKey:@"previewUrl"]) {
            NSString *urlString = [dict clean_objectForKey:@"previewUrl"];
            self.previewURL = [NSURL URLWithString:urlString];
        }
        
        if ([dict clean_objectForKey:@"trackViewUrl"]) {
            NSString *urlString = [dict clean_objectForKey:@"trackViewUrl"];
            self.viewURL = [NSURL URLWithString:urlString];
        }
        
        //Duration is provided in milliseconds, 
        //NSTimeInterval is seconds, divide by 1000
        
        if ([dict clean_objectForKey:@"trackTimeMillis"]) {
            
            double milliseconds = [[dict clean_objectForKey:@"trackTimeMillis"] doubleValue];
            self.duration = milliseconds / 1000.0;
        }
        
        //Formatted dates are ISO8601
        
        if ([dict clean_objectForKey:@"releaseDate"]) {
            
            ISO8601DateFormatter *f = [[ISO8601DateFormatter alloc] init];
            NSString *dateString = [dict objectForKey:@"releaseDate"];
            
            self.releaseDate = [f dateFromString:dateString];
            [f release];
        }
        
        NSString *imageURLString = [dict clean_objectForKey:@"artworkUrl100"];
        
        if ([imageURLString length]) {
            
            self.tbnImageURL = [NSURL URLWithString:imageURLString];;
            
            //Trickery to get the large image, swap the occurance of 100x100 for blank
            NSString *largeImageURLString = [imageURLString stringByReplacingOccurrencesOfString:@"100x100-75." withString:@""];
            self.imageURL = [NSURL URLWithString:largeImageURLString];
        }
    }
    
    return self;
}

- (void) dealloc 
{   
    [_itemDescription release], _itemDescription = nil;
    [_objectType release], _objectType = nil;
    [_genreName release], _genreName = nil;
    [_collectionName release], _collectionName = nil;
    [_artistName release], _artistName = nil;
    [_viewURL release], _viewURL = nil;
    [_previewURL release], _previewURL = nil;
    [_title release], _title = nil;
    [_releaseDate release], _releaseDate = nil;
    [_imageURL release], _imageURL = nil;
    [_tbnImageURL release], _tbnImageURL = nil;
    [super dealloc];
}

@end
