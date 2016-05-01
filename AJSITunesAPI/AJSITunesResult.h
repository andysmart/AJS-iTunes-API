//
//  AJSITunesResult.h
//  AJSITunesAPI
//
//  Created by Andy Smart on 06/09/2013.
//  Copyright (c) 2013 Rocket Town Ltd. All rights reserved.
//

#import <Mantle/Mantle.h>

extern NSString *const AJSITunesMediaTypeAll;
extern NSString *const AJSITunesMediaTypeMusic;
extern NSString *const AJSITunesMediaTypeMovie;
extern NSString *const AJSITunesMediaTypeMusicVideo;
extern NSString *const AJSITunesMediaTypeTVShow;
extern NSString *const AJSITunesMediaTypeAudiobook;
extern NSString *const AJSITunesMediaTypeEBook;
extern NSString *const AJSITunesMediaTypePodcast;
extern NSString *const AJSITunesMediaTypeShortFilm;
extern NSString *const AJSITunesMediaTypeSoftware;

extern NSString *const AJSITunesEntityTypeAlbum;
extern NSString *const AJSITunesEntityTypeAllArtist;
extern NSString *const AJSITunesEntityTypeAllTrack;
extern NSString *const AJSITunesEntityTypeAudiobook;
extern NSString *const AJSITunesEntityTypeAudiobookAuthor;
extern NSString *const AJSITunesEntityTypeEbook;
extern NSString *const AJSITunesEntityTypeIPadSoftware;
extern NSString *const AJSITunesEntityTypeMacSoftware;
extern NSString *const AJSITunesEntityTypeMix;
extern NSString *const AJSITunesEntityTypeMovie;
extern NSString *const AJSITunesEntityTypeMovieArtist;
extern NSString *const AJSITunesEntityTypeMusicTrack;
extern NSString *const AJSITunesEntityTypeMusicVideo;
extern NSString *const AJSITunesEntityTypePodcast;
extern NSString *const AJSITunesEntityTypePodcastAuthor;
extern NSString *const AJSITunesEntityTypeShortFilm;
extern NSString *const AJSITunesEntityTypeShortFilmArtist;
extern NSString *const AJSITunesEntityTypeSoftware;
extern NSString *const AJSITunesEntityTypeSong;
extern NSString *const AJSITunesEntityTypeTvEpisode;
extern NSString *const AJSITunesEntityTypeTvSeason;

extern NSString *const AJSITunesAttributeAlbumTerm;
extern NSString *const AJSITunesAttributeAllArtistTerm;
extern NSString *const AJSITunesAttributeAllTrackTerm;
extern NSString *const AJSITunesAttributeArtistTerm;
extern NSString *const AJSITunesAttributeAuthorTerm;
extern NSString *const AJSITunesAttributeComposerTerm;
extern NSString *const AJSITunesAttributeDescriptionTerm;
extern NSString *const AJSITunesAttributeDirectorTerm;
extern NSString *const AJSITunesAttributeFeatureFilmTerm;
extern NSString *const AJSITunesAttributeGenreIndex;
extern NSString *const AJSITunesAttributeKeywordsTerm;
extern NSString *const AJSITunesAttributeLanguageTerm;
extern NSString *const AJSITunesAttributeMixTerm;
extern NSString *const AJSITunesAttributeMovieArtistTerm;
extern NSString *const AJSITunesAttributeMovieTerm;
extern NSString *const AJSITunesAttributeProducerTerm;
extern NSString *const AJSITunesAttributeRatingIndex;
extern NSString *const AJSITunesAttributeRatingTerm;
extern NSString *const AJSITunesAttributeReleaseYearTerm;
extern NSString *const AJSITunesAttributeShortFilmTerm;
extern NSString *const AJSITunesAttributeShowTerm;
extern NSString *const AJSITunesAttributeSoftwareDeveloper;
extern NSString *const AJSITunesAttributeSongTerm;
extern NSString *const AJSITunesAttributeTitleTerm;
extern NSString *const AJSITunesAttributeTvEpisodeTerm;
extern NSString *const AJSITunesAttributeTvSeasonTerm;

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
@property (nonatomic, strong, readonly) NSString *viewURL;

//Collection name: usually the album name (music)

@property (nonatomic, strong, readonly) NSString *collectionName;
@property (nonatomic, strong, readonly) NSString *genreName;

@property (nonatomic, strong, readonly) NSString *itemDescription;

@property (nonatomic, strong, readonly) NSNumber *duration;

@property (nonatomic) BOOL isStreamable;

@end
