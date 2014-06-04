//
//  ViewController.m
//  KPGINC-Techsummit2014-SITE
//
//  Created by Mike on 6/4/14.
//  Copyright (c) 2014 Knowledge Power Group. All rights reserved.
//

#import "ViewController.h"
#import "APICall.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self callService];
    
    //[self callAPIService];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) callService{
    APICall *api = [[APICall alloc]init];
    
    NSString * url = @"https://data.pr.gov/resource/admit.json?campus=UTUADO";
    NSString *callType = @"GET";
    
    NSMutableDictionary *dataDict;
    dataDict = [api CallAPI:url HttpType:callType];
    NSLog(@"Response Data === %@", dataDict);
}

-(void) callAPIService;
{
    NSURL *callurl = [NSURL URLWithString:@"https://data.pr.gov/resource/admit.json?campus=UTUADO"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:callurl];
    [request setHTTPMethod:@"GET"];
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
                NSDictionary *userRespData = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&jsonError];
        
        //returnDataDict = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&jsonError];
        
        // Return to the main thread
                dispatch_async(dispatch_get_main_queue(), ^{
        
        
                });
        
        
        NSLog(@"Response Data === %@", userRespData);
        
    }];
    
}




@end
