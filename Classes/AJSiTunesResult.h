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

#import <Foundation/Foundation.h>

typedef enum {
    kAJSiTunesAPIMediaTypeAll = 0,
    kAJSiTunesAPIMediaTypeMusic = 1,
    kAJSiTunesAPIMediaTypeMusicVideos = 2,
    kAJSiTunesAPIMediaTypeMovies = 3,
    kAJSiTunesAPIMediaTypeTVShows = 4,
    kAJSiTunesAPIMediaTypeSoftware = 5,
    kAJSiTunesAPIMediaTypeAudiobook = 6,
    kAJSiTunesAPIMediaTypeEBook = 7,
    kAJSiTunesAPIMediaTypePodcast = 8,
    kAJSiTunesAPIMediaTypeShortFilm = 9
} kAJSiTunesAPIMediaType;

@interface AJSiTunesResult : NSObject 
{
    @private
    NSInteger _itemID;
    NSInteger _artistID;
    NSInteger _trackCount;
    NSInteger _trackNumber;
    
    kAJSiTunesAPIMediaType _mediaType;
    
    NSString *_title;
    NSString *_artistName;
    NSString *_collectionName;
    NSString *_genreName;
    NSString *_objectType;
    NSString *_itemDescription;
    
    NSDate *_releaseDate;
    
    NSURL *_imageURL;
    NSURL *_tbnImageURL;
    NSURL *_previewURL;
    NSURL *_viewURL;
    
    NSTimeInterval _duration;
}

@property (nonatomic, assign) NSInteger itemID;
@property (nonatomic, assign) NSInteger artistID;

@property (nonatomic, assign) NSInteger trackCount;
@property (nonatomic, assign) NSInteger trackNumber;

@property (nonatomic, assign) kAJSiTunesAPIMediaType mediaType;

//Title: Either track title, episode name, or item title (software)

@property (nonatomic, retain) NSString *title;

//Artist name: For film this is often lead actor / director

@property (nonatomic, retain) NSString *artistName;
@property (nonatomic, retain) NSDate *releaseDate;

//Path to the full fat image, may or may not exist

@property (nonatomic, retain) NSURL *imageURL;
@property (nonatomic, retain) NSURL *tbnImageURL;
@property (nonatomic, retain) NSURL *previewURL;
@property (nonatomic, retain) NSURL *viewURL;

//Collection name: usually the album name (music)

@property (nonatomic, retain) NSString *collectionName;
@property (nonatomic, retain) NSString *genreName;

@property (nonatomic, retain) NSString *objectType;

@property (nonatomic, retain) NSString *itemDescription;

@property (nonatomic, assign) NSTimeInterval duration;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
