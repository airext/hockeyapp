//
//  HockeyApp.h
//  HockeyApp
//
//  Created by Max Rozdobudko on 1/17/18.
//  Copyright © 2018 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HockeySDK/HockeySDK.h>

@interface ANXHockeyApp : NSObject

#pragma mark Shared Instance

+ (ANXHockeyApp*)sharedInstance;

#pragma mark Scan

- (void)configureWithIdentifier:(NSString *)appIdentifier;

- (void)start;

@end
