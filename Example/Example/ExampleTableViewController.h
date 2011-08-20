//
//  ExampleTableViewController.h
//  Example
//
//  Created by Andy Smart on 20/08/2011.
//  Copyright 2011 Andy Smart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJSiTunesAPI.h"

@interface ExampleTableViewController : UITableViewController 
<AJSiTunesAPIDelegate> {
    
    @private
    NSArray *_searchResults;
    AJSiTunesAPI *_iTunesAPIController;
    
    //Interface
    
    UIActivityIndicatorView *_loadingSpinner;
}

@property (nonatomic, retain) UIActivityIndicatorView *loadingSpinner;

@end
