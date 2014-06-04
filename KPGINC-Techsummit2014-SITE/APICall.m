//
//  APICall.m
//  KPGINC-Techsummit2014-SITE
//
//  Created by Mike on 6/4/14.
//  Copyright (c) 2014 Knowledge Power Group. All rights reserved.
//

#import "APICall.h"

@implementation APICall {
    
    NSMutableDictionary *returnDataDict;
    NSMutableArray *returnDataArr;
    
}


-(NSMutableDictionary *) CallAPI:(NSString *)url HttpType:(NSString *)httptype{
    
    returnDataArr = [[NSMutableArray alloc] init];
    
    NSURL *callurl = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:callurl];
    [request setHTTPMethod:httptype];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setTimeoutInterval:120];
    
    //[request setHTTPBody:userData];
    
    // make the async connection
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler: ^(NSURLResponse *response, NSData *responseData, NSError *responseError) {
        
        
        if (responseError) {
            NSLog(@"%s: sendAsyncRequest error: %@", __FUNCTION__, responseError);
            return;
        }
        
        // manipulate the response data
        NSError * jsonError;
//        NSDictionary *userRespData = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&jsonError];
        
        returnDataDict = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&jsonError];
        
        // Return to the main thread
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            
//        });
        
        NSLog(@"Response Data APICall === %@", returnDataDict);
        
        
    }];
    
   return returnDataDict;
}



@end
