//
//  APICall.h
//  KPGINC-Techsummit2014-SITE
//
//  Created by Mike on 6/4/14.
//  Copyright (c) 2014 Knowledge Power Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APICall : NSObject

-(NSMutableDictionary *) CallAPI:(NSString *)url HttpType:(NSString *)httptype;



@end
