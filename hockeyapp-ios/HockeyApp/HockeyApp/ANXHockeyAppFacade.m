//
//  ANXHockeyAppFacade.m
//  HockeyApp
//
//  Created by Max Rozdobudko on 1/18/18.
//  Copyright © 2018 Max Rozdobudko. All rights reserved.
//

#import "ANXHockeyAppFacade.h"
#import "FlashRuntimeExtensions.h"
#import "ANXHockeyAppConversionRoutines.h"
#import "ANXHockeyApp.h"

@implementation ANXHockeyAppFacade

@end

#pragma mark API

FREObject ANXHockeyAppIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[]){
    NSLog(@"ANXHockeyAppIsSupported");
    return [ANXHockeyAppConversionRoutines convertBoolToFREObject: YES];
}

FREObject ANXHockeyAppVersion(FREContext context, void* functionData, uint32_t argc, FREObject argv[]){
    NSLog(@"ANXHockeyAppVersion");
    return [ANXHockeyAppConversionRoutines convertNSStringToFREObject: [[ANXHockeyApp sharedInstance] version]];
}


FREObject ANXHockeyAppConfigure(FREContext context, void* functionData, uint32_t argc, FREObject argv[]) {
    NSLog(@"ANXHockeyAppConfigure");

    if (argc > 0) {
        [[ANXHockeyApp sharedInstance] configureWithIdentifier:[ANXHockeyAppConversionRoutines convertFREObjectToNSString:argv[0]]];
    }

    return NULL;
}

FREObject ANXHockeyAppStart(FREContext context, void* functionData, uint32_t argc, FREObject argv[]) {
    NSLog(@"ANXHockeyAppStart");
    [[ANXHockeyApp sharedInstance] start];
    return NULL;
}

#pragma mark ContextInitialize/ContextFinalizer

void ANXHockeyAppContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet) {

    *numFunctionsToSet = 4;

    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * (*numFunctionsToSet));

    func[0].name = (const uint8_t*) "isSupported";
    func[0].functionData = NULL;
    func[0].function = &ANXHockeyAppIsSupported;

    func[1].name = (const uint8_t*) "version";
    func[1].functionData = NULL;
    func[1].function = &ANXHockeyAppVersion;

    func[2].name = (const uint8_t*) "configure";
    func[2].functionData = NULL;
    func[2].function = &ANXHockeyAppConfigure;

    func[3].name = (const uint8_t*) "start";
    func[3].functionData = NULL;
    func[3].function = &ANXHockeyAppStart;

    *functionsToSet = func;
}

void ANXHockeyAppContextFinalizer(FREContext ctx){
    NSLog(@"ANXHockeyAppContextFinalizer");
}

#pragma mark Initializer/Finalizer

void ANXHockeyAppInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet) {
    NSLog(@"ANXHockeyAppInitializer");

    *extDataToSet = NULL;

    *ctxInitializerToSet = &ANXHockeyAppContextInitializer;
    *ctxFinalizerToSet = &ANXHockeyAppContextFinalizer;
}

void ANXHockeyAppFinalizer(void* extData) {
    NSLog(@"ANXHockeyAppFinalizer");
}
