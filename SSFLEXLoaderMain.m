//
//  RHDownloadReveal.m
//  RHDownloadReveal
//
//  Created by Richard Heard on 21/03/2014.
//  Copyright (c) 2014 Richard Heard. All rights reserved.
//

#include <unistd.h>
#include <sys/stat.h>

#include "common.h"
#include <partial/partial.h>
char endianness = IS_LITTLE_ENDIAN;

#ifdef __OBJC__
#import <Foundation/Foundation.h>
#endif

//download libReveal using partialzip

NSString *libraryPath = @"/Library/PreferenceLoader/Preferences/FLEXDylib.dylib";

int main(int argc, const char *argv[], const char *envp[]){
    
    if (argc > 1 && strcmp(argv[1], "upgrade") != 0) {
        printf("SSFLEXLoader CYDIA upgrade, nuking existing %s\n", [libraryPath UTF8String]);
        [[NSFileManager defaultManager] removeItemAtPath:libraryPath error:NULL];
    } else {
        printf("SSFLEXLoader before move file");
    }
    
    printf("================SSFLEXLoader started!!!================");
    
	return 0;
}
