//
//  FIleSystemHelper.h
//  MIMSIOSClient
//
//  Created by Michael Diaz on 5/8/14.
//  Copyright (c) 2014 Knowledge Power Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FIleSystemHelper : NSObject

+(NSURL *)pathForDocumentsFile:(NSString *)fileName;

@end
