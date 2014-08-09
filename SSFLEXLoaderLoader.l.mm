//
//  RHRevealLoader.xm
//  RHRevealLoader
//
//  Created by Richard Heard on 21/03/2014.
//  Copyright (c) 2014 Richard Heard. All rights reserved.
//

#include <dlfcn.h>
%ctor {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSDictionary *prefs = [[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.joeyio.FLEXLoader.plist"] retain];
    NSString *libraryPath = @"/Library/PreferenceLoader/Preferences/FLEXDylib.dylib";
    
    NSLog(@"SSFLEXLoader before loaded %@", libraryPath);
    
    if([[prefs objectForKey:[NSString stringWithFormat:@"FLEXLoaderEnabled-%@", [[NSBundle mainBundle] bundleIdentifier]]] boolValue]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:libraryPath]){
            dlopen([libraryPath UTF8String], RTLD_NOW);
            NSLog(@"SSFLEXLoader loaded %@", libraryPath);
        } else {
            NSLog(@"SSFLEXLoader file not exists %@", libraryPath);
        }
    } else {
        NSLog(@"SSFLEXLoader not enabled %@", libraryPath);
    }
    
    NSLog(@"SSFLEXLoader after loaded %@", libraryPath);


    [pool drain];
}
