//
//  ANXPhotosConversionRoutines.m
//  Photos
//
//  Created by Max Rozdobudko on 10/30/16.
//  Copyright © 2016 Centric. All rights reserved.
//

#import <os/log.h>
#import <syslog.h>

#import "ANXHockeyAppConversionRoutines.h"

@implementation ANXHockeyAppConversionRoutines

+(FREObject) convertBoolToFREObject: (BOOL) value
{
    FREObject result;
    
    if (value)
        FRENewObjectFromBool((uint32_t) 1, &result);
    else
        FRENewObjectFromBool((uint32_t) 0, &result);
    
    return result;
}

+(BOOL) convertFREObjectToBool: (FREObject) value
{
    uint32_t tempValue;
    
    FREResult result = FREGetObjectAsBool(value, &tempValue);
    
    if (result != FRE_OK)
        return NO;
    
    return tempValue > 0;
}

+(FREObject) convertNSStringToFREObject:(NSString*) string
{
    if (string == nil) return NULL;
    
    const char* utf8String = string.UTF8String;
    
    unsigned long length = strlen( utf8String );
    
    FREObject converted;
    FREResult result = FRENewObjectFromUTF8((uint32_t) length + 1, (const uint8_t*) utf8String, &converted);
    
    if (result != FRE_OK)
        return NULL;
    
    return converted;
}

+(NSString*) convertFREObjectToNSString: (FREObject) string
{
    FREResult result;
    
    uint32_t length = 0;
    const uint8_t* tempValue = NULL;
    
    result = FREGetObjectAsUTF8(string, &length, &tempValue);
    
    if (result != FRE_OK)
        return nil;
    
    NSString *value = [NSString stringWithUTF8String: (const char*) tempValue];
    
    return value;
}

+(FREObject) convertNSIntegerToFREObject: (NSInteger) value
{
    FREObject convertedValue;
    
    FREResult result = FRENewObjectFromInt32((int32_t) value, &convertedValue);
    
    if (result != FRE_OK)
        return NULL;
    
    return convertedValue;
}

+(NSInteger) convertFREObjectToNSInteger: (FREObject) value
{
    int32_t convertedValue;
    
    FREResult result = FREGetObjectAsInt32(value, &convertedValue);
    
    if (result != FRE_OK)
        return 0;
    
    return (NSInteger) convertedValue;
}

//+ (CGImageRef)convertFREBitmapDataToCGImage:(FREObject)value {
//    
//    FREBitmapData2  bitmapData;
//    
//    FREAcquireBitmapData2(value, &bitmapData);
//    
//    int width  = bitmapData.width;
//    int height = bitmapData.height;
//    
//    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, bitmapData.bits32, (width * height * 4), NULL);
//    
//    int                     bitsPerComponent    = 8;
//    int                     bitsPerPixel        = 32;
//    int                     bytesPerRow         = 4 * width;
//    CGColorSpaceRef         colorSpaceRef       = CGColorSpaceCreateDeviceRGB();
//    CGBitmapInfo            bitmapInfo;
//    
//    if (bitmapData.hasAlpha) {
//        if (bitmapData.isPremultiplied)
//            bitmapInfo = kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst;
//        else
//            bitmapInfo = kCGBitmapByteOrder32Little | kCGImageAlphaFirst;
//    } else {
//        bitmapInfo = kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst;
//    }
//    
//    CGColorRenderingIntent  renderingIntent     = kCGRenderingIntentDefault;
//    CGImageRef              imageRef            = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpaceRef, bitmapInfo, provider, NULL, NO, renderingIntent);
//    
//    id <NSFastEnumeration> results = [reader scanImage:imageRef];
//    
//    ZBarSymbol *sym = nil;
//    for(sym in results) {
//        if (sym) {
//            NSLog(@"Found barcode! quality: %d string: %@", sym.quality, sym.data);
//            FREDispatchStatusEventAsync(ctx, (uint8_t*)[@"data" UTF8String], (uint8_t*)[sym.data UTF8String]);
//            break;
//        }
//    }
//    
//    CGColorSpaceRelease(colorSpaceRef);
//    CGImageRelease(imageRef);
//    CGDataProviderRelease(provider);
//    FREReleaseBitmapData(objectBitmapData);
//}

@end
