//
//  AJSITunesHTTPClient.h
//  AJSITunesAPI
//
//  Created by Andy Smart on 06/09/2013.
//  Copyright (c) 2013 Rocket Town Ltd. All rights reserved.
//

#import "AFHTTPClient.h"

typedef void (^AJSITunesCompletionBlock)(NSArray *results, NSError *error);

@interface AJSITunesClient : AFHTTPClient

+ (AJSITunesClient *)sharedClient;

@end
