//
//  ANXPhotosConversionRoutines.h
//  Photos
//
//  Created by Max Rozdobudko on 10/30/16.
//  Copyright © 2016 Centric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "FlashRuntimeExtensions.h"

@interface ANXHockeyAppConversionRoutines : NSObject

+(FREObject) convertBoolToFREObject: (BOOL) value;
+(BOOL) convertFREObjectToBool: (FREObject) value;

+(FREObject) convertNSStringToFREObject:(NSString*) string;
+(NSString*) convertFREObjectToNSString: (FREObject) string;

+(FREObject) convertNSIntegerToFREObject: (NSInteger) value;
+(NSInteger) convertFREObjectToNSInteger: (FREObject) value;

//+ (CGImageRef)convertFREBitmapDataToCGImage:(FREObject)value;

@end
