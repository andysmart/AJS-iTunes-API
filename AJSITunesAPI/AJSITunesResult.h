//
//  AJSITunesResult.h
//  AJSITunesAPI
//
//  Created by Andy Smart on 06/09/2013.
//  Copyright (c) 2013 Rocket Town Ltd. All rights reserved.
//

#import <Mantle/Mantle.h>

static NSString *const AJSITunesMediaTypeAll = @"all";
static NSString *const AJSITunesMediaTypeMusic = @"music";
static NSString *const AJSITunesMediaTypeMovie = @"movie";
static NSString *const AJSITunesMediaTypeMusicVideo = @"musicVideo";
static NSString *const AJSITunesMediaTypeTVShow = @"tvShow";
static NSString *const AJSITunesMediaTypeAudiobook = @"audiobook";
static NSString *const AJSITunesMediaTypeEBook = @"ebook";
static NSString *const AJSITunesMediaTypePodcast = @"podcast";
static NSString *const AJSITunesMediaTypeShortFilm = @"shortFilm";
static NSString *const AJSITunesMediaTypeSoftware = @"software";

@interface AJSITunesResult : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong, readonly) NSNumber *itemID;
@property (nonatomic, strong, readonly) NSNumber *artistID;

@property (nonatomic, strong, readonly) NSNumber *trackCount;
@property (nonatomic, strong, readonly) NSNumber *trackNumber;

@property (nonatomic, strong, readonly) NSString *mediaType;

//Title: Either track title, episode name, or item title (software)

@property (nonatomic, strong, readonly) NSString *title;

//Artist name: For film this is often lead actor / director

@property (nonatomic, strong, readonly) NSString *artistName;
@property (nonatomic, strong, readonly) NSDate *releaseDate;

//Path to the full fat image, may or may not exist

@property (nonatomic, strong, readonly) NSURL *imageURL;
@property (nonatomic, strong, readonly) NSURL *thumnailImageURL;
@property (nonatomic, strong, readonly) NSURL *previewURL;
@property (nonatomic, strong, readonly) NSURL *viewURL;

//Collection name: usually the album name (music)

@property (nonatomic, strong, readonly) NSString *collectionName;
@property (nonatomic, strong, readonly) NSString *genreName;

@property (nonatomic, strong, readonly) NSString *objectType;

@property (nonatomic, strong, readonly) NSString *itemDescription;

@property (nonatomic, strong, readonly) NSNumber *duration;

@end
