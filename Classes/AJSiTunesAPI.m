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

#import "AJSiTunesAPI.h"
#import "SBJson.h"
#import "AJSiTunesResult.h"
#import "NSString+AJSAdditions.h"

NSString *const kiTunesAPIEndpoint = @"http://itunes.apple.com/search";

NSString *const kiTunesAPIQueryParam = @"term";
NSString *const kiTunesAPIMediaTypeParam = @"media";
NSString *const kiTunesAPICountryCodeParam = @"country";
NSString *const kiTunesAPILimitParam = @"limit";

@interface AJSiTunesAPI()
@property (nonatomic, retain) ASIHTTPRequest *request;

- (void) makeRequestToURL:(NSURL *)url 
      withCompletionBlock:(AJSiTunesAPICompletionBlock)completionBlock 
             failureBlock:(AJSiTunesAPIFailureBlock)failureBlock;

@end

@implementation AJSiTunesAPI
@synthesize request = _request;
@synthesize delegate = _delegate;

- (void) dealloc 
{
    [_request clearDelegatesAndCancel];
    [_request release], _request = nil;
    [super dealloc];
}

#pragma mark - Helpers

- (void) searchMediaWithSearchTerm:(NSString *)searchTerm 
{
    [self searchMediaWithType:kAJSiTunesAPIMediaTypeAll 
                   searchTerm:searchTerm 
                  countryCode:@"US" 
                        limit:50];
}

- (void) searchMediaWithType:(kAJSiTunesAPIMediaType)type 
                  searchTerm:(NSString *)keywords
                 countryCode:(NSString *)countryCode
                       limit:(NSInteger)limit
{
    [self searchMediaWithType:type
                   searchTerm:keywords
                  countryCode:countryCode
                        limit:limit
              completionBlock:nil
                 failureBlock:nil];
}

- (void) searchMediaWithSearchTerm:(NSString *)searchTerm 
                   completionBlock:(AJSiTunesAPICompletionBlock)completionBlock 
                      failureBlock:(AJSiTunesAPIFailureBlock)failureBlock 
{
    [self searchMediaWithType:kAJSiTunesAPIMediaTypeAll
                   searchTerm:searchTerm
                  countryCode:@"US"
                        limit:50
              completionBlock:completionBlock
                 failureBlock:failureBlock];
}

#pragma mark - Main Request

- (void) searchMediaWithType:(kAJSiTunesAPIMediaType)type 
                  searchTerm:(NSString *)keywords 
                 countryCode:(NSString *)countryCode 
                       limit:(NSInteger)limit 
             completionBlock:(AJSiTunesAPICompletionBlock)completionBlock 
                failureBlock:(AJSiTunesAPIFailureBlock)failureBlock 
{
    keywords = [keywords ajs_cleanedStringForQuery];
    
    NSMutableString *queryString = [NSMutableString string];
    [queryString appendFormat:@"%@=%@", kiTunesAPIQueryParam, keywords];
    
    NSString *mediaType = nil;
    
    switch (type) {
        case kAJSiTunesAPIMediaTypeMusic:
            
            mediaType = @"music";
            break;
        case kAJSiTunesAPIMediaTypeMovies:
            
            mediaType = @"movie";
            break;
        case kAJSiTunesAPIMediaTypeMusicVideos:
            
            mediaType = @"musicVideo";
            break;
        case kAJSiTunesAPIMediaTypeTVShows:
            
            mediaType = @"tvShow";
            break;
        case kAJSiTunesAPIMediaTypeAudiobook:
            
            mediaType = @"audiobook";
            break;
        case kAJSiTunesAPIMediaTypeEBook:
            
            mediaType = @"ebook";
            break;
        case kAJSiTunesAPIMediaTypePodcast:
            
            mediaType = @"podcast";
            break;
        case kAJSiTunesAPIMediaTypeShortFilm:
            
            mediaType = @"shortFilm";
            break;
        case kAJSiTunesAPIMediaTypeSoftware:
            
            mediaType = @"software";
            break;
        default:
            mediaType = @"all";
            break;
    }
    
    if (mediaType) {
        [queryString appendFormat:@"&%@=%@", kiTunesAPIMediaTypeParam, mediaType];
    }
    
    if (countryCode && [countryCode length]) {
        [queryString appendFormat:@"&%@=%@", kiTunesAPICountryCodeParam, countryCode];
    }
    
    if (limit > 0 && limit <= 200) {
        [queryString appendFormat:@"&%@=%d", kiTunesAPILimitParam, limit];
    }
    
    //Build the request
    
    NSString *urlString = [NSString stringWithFormat:@"%@?%@",
                           kiTunesAPIEndpoint, queryString];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    [self makeRequestToURL:url 
       withCompletionBlock:completionBlock 
              failureBlock:failureBlock];
}

#pragma mark - Private

- (void) makeRequestToURL:(NSURL *)url 
      withCompletionBlock:(AJSiTunesAPICompletionBlock)completionBlock 
             failureBlock:(AJSiTunesAPIFailureBlock)failureBlock 
{    
    if ([self.request isExecuting]) {
        [self.request cancel];
    }
    
    __block ASIHTTPRequest *r = [ASIHTTPRequest requestWithURL:url];
    
    [r setCompletionBlock:^{
        
        //Parse the data
        //Can never have enough type checking
        //when dealing with API responses
        
        NSDictionary *results = [[r responseString] JSONValue];
        NSMutableArray *formattedResults = [NSMutableArray array];
        
        if ([results isKindOfClass:[NSDictionary class]]) {
            
            NSArray *rawResults = [results objectForKey:@"results"];
            
            if (rawResults && [rawResults isKindOfClass:[NSArray class]]) {
                
                for (NSDictionary *itemDict in rawResults) {
                    if (itemDict && [itemDict isKindOfClass:[NSDictionary class]]) {
                        
                        AJSiTunesResult *item = [[AJSiTunesResult alloc] 
                                                 initWithDictionary:itemDict];
                        
                        if (item) {
                            [formattedResults addObject:item];
                            [item release];
                        }
                    }
                }
            }
        }
        
        //Notify either via Block, or by Delegate
        //if either is set
        
        if (completionBlock) {
            
            completionBlock(formattedResults);
            
        } else if (self.delegate && [self.delegate respondsToSelector:@selector(iTunesApi:didCompleteWithResults:)]) {
            [self.delegate iTunesApi:self didCompleteWithResults:formattedResults];
        }
        
    }];
    
    [r setFailedBlock:^{
        
        NSError *error = [r error];
        
        if (error) {
            
            if (failureBlock) {
                
                failureBlock(error);
                
            } else if (self.delegate && [self.delegate respondsToSelector:@selector(iTunesAPI:didFailWithError:)]) {
                [self.delegate iTunesAPI:self didFailWithError:error];
            }
        } else {
            //What the hell happened here?!
        }
    }];
    
    self.request = r;
    
    [self.request startAsynchronous]; //Make the request
}

@end
