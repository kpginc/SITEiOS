//
//  FIleSystemHelper.m
//  MIMSIOSClient
//
//  Created by Michael Diaz on 5/8/14.
//  Copyright (c) 2014 Knowledge Power Group. All rights reserved.
//

#import "FIleSystemHelper.h"

@implementation FIleSystemHelper

+(NSURL *)pathForDocumentsFile:(NSString *)fileName {
    
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *directories = [fm URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *documentPath  = [directories objectAtIndex:0];
    
    return [documentPath URLByAppendingPathComponent:fileName];
}

@end
