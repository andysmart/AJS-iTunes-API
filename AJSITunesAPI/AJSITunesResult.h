//
//  AJSITunesResult.h
//  AJSITunesAPI
//
//  Created by Andy Smart on 06/09/2013.
//  Copyright (c) 2013 Rocket Town Ltd. All rights reserved.
//

#import <Mantle/Mantle.h>

NSString *const AJSITunesMediaTypeAll = @"all";
NSString *const AJSITunesMediaTypeMusic = @"music";
NSString *const AJSITunesMediaTypeMovie = @"movie";
NSString *const AJSITunesMediaTypeMusicVideo = @"musicVideo";
NSString *const AJSITunesMediaTypeTVShow = @"tvShow";
NSString *const AJSITunesMediaTypeAudiobook = @"audiobook";
NSString *const AJSITunesMediaTypeEBook = @"ebook";
NSString *const AJSITunesMediaTypePodcast = @"podcast";
NSString *const AJSITunesMediaTypeShortFilm = @"shortFilm";
NSString *const AJSITunesMediaTypeSoftware = @"software";

@interface AJSITunesResult : MTLModel

@property (nonatomic, assign) NSInteger itemID;
@property (nonatomic, assign) NSInteger artistID;

@property (nonatomic, assign) NSInteger trackCount;
@property (nonatomic, assign) NSInteger trackNumber;

@property (nonatomic, strong) NSString *mediaType;

//Title: Either track title, episode name, or item title (software)

@property (nonatomic, strong) NSString *title;

//Artist name: For film this is often lead actor / director

@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSDate *releaseDate;

//Path to the full fat image, may or may not exist

@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) NSURL *tbnImageURL;
@property (nonatomic, strong) NSURL *previewURL;
@property (nonatomic, strong) NSURL *viewURL;

//Collection name: usually the album name (music)

@property (nonatomic, strong) NSString *collectionName;
@property (nonatomic, strong) NSString *genreName;

@property (nonatomic, strong) NSString *objectType;

@property (nonatomic, strong) NSString *itemDescription;

@property (nonatomic, assign) NSTimeInterval duration;

@end
