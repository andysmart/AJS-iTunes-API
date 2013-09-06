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
              @"imageURLString" : @"artworkUrl100" };
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
