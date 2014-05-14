//
//  AJSITunesHTTPClient.h
//  AJSITunesAPI
//
//  Created by Andy Smart on 06/09/2013.
//  Copyright (c) 2013 Rocket Town Ltd. All rights reserved.
//

#import "AFHTTPSessionManager.h"

typedef void (^AJSITunesCompletionBlock)(NSArray *results, NSError *error);

@interface AJSITunesClient : AFHTTPSessionManager

+ (AJSITunesClient *)sharedClient;
- (id) searchMedia:(NSString *)keywords completion:(AJSITunesCompletionBlock)completion;

- (id) searchMediaWithType:(NSString *)type
                  keywords:(NSString *)keywords
                   country:(NSString *)countryCode
                     limit:(NSUInteger)limit
                completion:(AJSITunesCompletionBlock)completion;

- (id) searchMediaWithType:(NSString *)type
                entityType:(NSString *)entityType
                 attribute:(NSString *)attribute
                  keywords:(NSString *)keywords
                   country:(NSString *)countryCode
                     limit:(NSUInteger)limit
                completion:(AJSITunesCompletionBlock)completion;

@end
