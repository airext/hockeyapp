//
//  HockeyApp.m
//  HockeyApp
//
//  Created by Max Rozdobudko on 1/17/18.
//  Copyright © 2018 Max Rozdobudko. All rights reserved.
//

#import "ANXHockeyApp.h"

@implementation ANXHockeyApp

#pragma mark Shared instance

static ANXHockeyApp* _sharedInstance = nil;

+ (ANXHockeyApp*)sharedInstance {
    if (_sharedInstance == nil) {
        _sharedInstance = [[super allocWithZone:NULL] init];
    }
    return _sharedInstance;
}

#pragma mark Initializers

-(id) init {
    self = [super init];
    return self;
}

#pragma mark Methods

- (void)configureWithIdentifier:(NSString *)appIdentifier {
    [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:appIdentifier];
}

- (void)start {
    [[BITHockeyManager sharedHockeyManager] startManager];
}

@end
