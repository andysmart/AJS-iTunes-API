//
//  AJSITunesResult.m
//  AJSITunesAPI
//
//  Created by Andy Smart on 06/09/2013.
//  Copyright (c) 2013 Rocket Town Ltd. All rights reserved.
//

#import "AJSITunesResult.h"
#import <ISO8601DateFormatter/ISO8601DateFormatter.h>

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

NSString *const AJSITunesEntityTypeAlbum = @"album";
NSString *const AJSITunesEntityTypeAllArtist = @"allArtist";
NSString *const AJSITunesEntityTypeAllTrack = @"allTrack";
NSString *const AJSITunesEntityTypeAudiobook = @"audiobook";
NSString *const AJSITunesEntityTypeAudiobookAuthor = @"audiobookAuthor";
NSString *const AJSITunesEntityTypeEbook = @"ebook";
NSString *const AJSITunesEntityTypeIPadSoftware = @"iPadSoftware";
NSString *const AJSITunesEntityTypeMacSoftware = @"software";
NSString *const AJSITunesEntityTypeMix = @"mix";
NSString *const AJSITunesEntityTypeMovie = @"movie";
NSString *const AJSITunesEntityTypeMovieArtist = @"movieArtist";
NSString *const AJSITunesEntityTypeMusicTrack = @"musicTrack";
NSString *const AJSITunesEntityTypeMusicVideo = @"musicVideo";
NSString *const AJSITunesEntityTypePodcast = @"podcast";
NSString *const AJSITunesEntityTypePodcastAuthor = @"podcastAutor";
NSString *const AJSITunesEntityTypeShortFilm = @"shortFilm";
NSString *const AJSITunesEntityTypeShortFilmArtist = @"shortFilmArtist";
NSString *const AJSITunesEntityTypeSoftware = @"software";
NSString *const AJSITunesEntityTypeSong = @"song";
NSString *const AJSITunesEntityTypeTvEpisode = @"tvEpisode";
NSString *const AJSITunesEntityTypeTvSeason = @"tvSeason";

NSString *const AJSITunesAttributeAlbumTerm = @"albumTerm";
NSString *const AJSITunesAttributeAllArtistTerm = @"allArtistTerm";
NSString *const AJSITunesAttributeAllTrackTerm = @"allTrackTerm";
NSString *const AJSITunesAttributeArtistTerm = @"artistTerm";
NSString *const AJSITunesAttributeAuthorTerm = @"authorTerm";
NSString *const AJSITunesAttributeComposerTerm = @"composerTerm";
NSString *const AJSITunesAttributeDescriptionTerm = @"descriptionTerm";
NSString *const AJSITunesAttributeDirectorTerm = @"directorTerm";
NSString *const AJSITunesAttributeFeatureFilmTerm = @"featureFilmTerm";
NSString *const AJSITunesAttributeGenreIndex = @"genreIndex";
NSString *const AJSITunesAttributeKeywordsTerm = @"keywordsTerm";
NSString *const AJSITunesAttributeLanguageTerm = @"languageTerm";
NSString *const AJSITunesAttributeMixTerm = @"mixTerm";
NSString *const AJSITunesAttributeMovieArtistTerm = @"movieArtistTerm";
NSString *const AJSITunesAttributeMovieTerm = @"movieTerm";
NSString *const AJSITunesAttributeProducerTerm = @"producerTerm";
NSString *const AJSITunesAttributeRatingIndex = @"ratingIndex";
NSString *const AJSITunesAttributeRatingTerm = @"ratingTerm";
NSString *const AJSITunesAttributeReleaseYearTerm = @"releaseYearTerm";
NSString *const AJSITunesAttributeShortFilmTerm = @"shortFilmTerm";
NSString *const AJSITunesAttributeShowTerm = @"showTerm";
NSString *const AJSITunesAttributeSoftwareDeveloper = @"softwareDeveloper";
NSString *const AJSITunesAttributeSongTerm = @"songTerm";
NSString *const AJSITunesAttributeTitleTerm = @"titleTerm";
NSString *const AJSITunesAttributeTvEpisodeTerm = @"tvEpisodeTerm";
NSString *const AJSITunesAttributeTvSeasonTerm = @"tvSeasonTerm";

@interface AJSITunesResult()
@property (nonatomic, strong) NSString *imageURLString;
@end

@implementation AJSITunesResult

+ (ISO8601DateFormatter *)dateFormatter
{
    ISO8601DateFormatter *formatter = [[ISO8601DateFormatter alloc] init];
    return formatter;
}

#pragma mark - Images

- (NSURL *)imageURL
{
    NSString *stripped = [self.imageURLString stringByReplacingOccurrencesOfString:@"100x100-75." withString:@""];
    return [NSURL URLWithString:stripped];
}

- (NSURL *)thumnailImageURL
{
    return [NSURL URLWithString:self.imageURLString];
}

#pragma mark - JSON Serialization

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{ @"itemID" : @"trackId",
              @"artistID" : @"artistId",
              @"trackCount" : @"trackCount",
              @"trackNumber" : @"trackNumber",
              @"title" : @"trackName",
              @"artistName" : @"artistName",
              @"genreName" : @"primaryGenreName",
              @"collectionName" : @"collectionName",
              @"mediaType" : @"kind",
              @"itemDescription" : @"longDescription",
              @"previewURL" : @"previewUrl",
              @"viewURL" : @"trackViewUrl",
              @"duration" : @"trackTimeMillis",
              @"releaseDate" : @"releaseDate",
              @"imageURLString" : @"artworkUrl100",
              @"smallImageURLString" : @"artworkUrl60"};
}


+ (NSValueTransformer *)previewURLValueTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)viewURLValueTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)releaseDateValueTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [[self dateFormatter] dateFromString:str];
    } reverseBlock:^(NSDate *date) {
        return [[self dateFormatter] stringFromDate:date];
    }];;
}

@end
