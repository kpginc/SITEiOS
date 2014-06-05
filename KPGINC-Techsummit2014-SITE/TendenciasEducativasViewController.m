//
//  TendenciasEducativasViewController.m
//  KPGINC-Techsummit2014-SITE
//
//  Created by Mike on 6/4/14.
//  Copyright (c) 2014 Knowledge Power Group. All rights reserved.
//

#import "TendenciasEducativasViewController.h"

@interface TendenciasEducativasViewController () {
    NSMutableArray *responseArray;
    NSMutableArray *userRespData;
    int totalMajorCount;
    
    NSMutableArray *finalDataArray;
    NSArray *sortedArray;
    
}

@end

@implementation TendenciasEducativasViewController

@synthesize PercentMajor1Lbl;
@synthesize PercentMajor2Lbl;
@synthesize PercentMajor3Lbl;
@synthesize PercentMajor4Lbl;
@synthesize PercentMajor5Lbl;
@synthesize PercentMajor6Lbl;

@synthesize MajorName1Lbl;
@synthesize MajorName2Lbl;
@synthesize MajorName3Lbl;
@synthesize MajorName4Lbl;
@synthesize MajorName5Lbl;
@synthesize MajorName6Lbl;

@synthesize MalePercentageLbl, FemalePercentageLbl;
@synthesize PuebloLbl;
@synthesize CampusNameLbl;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self callAPIService];
    
    [self getConsentrationByCampus:@"PONCE"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

    
    
//    
//    for(NSDictionary *dict in responseDict) {
//        NSString *program = [dict objectForKey: @"program"];
//    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



//NSArray *states = [myArrayOfCustomObjects valueForKey:@"state"];
//NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:states];
//NSSet *uniqueStates = [orderedSet set];

//-(void) callAPIService;
//{
//    NSURL *callurl = [NSURL URLWithString:@"https://data.pr.gov/resource/admit.json?campus=UTUADO"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:callurl];
//    [request setHTTPMethod:@"GET"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
//    [request setTimeoutInterval:120];
//    
//    //[request setHTTPBody:userData];
//    
//    // make the async connection
//    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler: ^(NSURLResponse *response, NSData *responseData, NSError *responseError) {
//        
//        
//        if (responseError) {
//            NSLog(@"%s: sendAsyncRequest error: %@", __FUNCTION__, responseError);
//            return;
//        }
//        
//        // manipulate the response data
//        NSError * jsonError;
//        //NSDictionary *userRespData = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&jsonError];
//        
//        responseArray = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&jsonError];
//        
//        // Return to the main thread
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            
//        });
//        
//        
//        NSLog(@"Response Data === %@", responseArray);
//        
//        //NSArray *names = [NSArray arrayWithObjects:@"John", @"Jane", @"John", nil];
//        
//        
//        
//        for(NSDictionary *dict in responseArray) {
//             NSString *program = [dict objectForKey: @"program"];
//            if ([program length] > 6) {
//                
//                program = [program substringWithRange:NSMakeRange(0, 6)];
//            }
//            
//        }
//        
//        
//        
//        
//        NSCountedSet *set = [[NSCountedSet alloc] initWithArray:responseArray];
//        
//        for (id item in set)
//        {
//            NSLog(@"Name=%@, Count=%lu", item, (unsigned long)[set countForObject:item]);
//        }
//        
//        
//        
//    }];
//    
//}




-(void) getConsentrationByCampus:(NSString*)campus
{
    NSString *endpointWithCampusParam = @"https://data.pr.gov/resource/admit.json?campus=";
    
    endpointWithCampusParam = [endpointWithCampusParam stringByAppendingString:campus];
    
    
    NSURL *callurl = [NSURL URLWithString:endpointWithCampusParam];
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:callurl];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setTimeoutInterval:120];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler: ^(NSURLResponse *response, NSData *responseData, NSError *responseError) {
        
        
        if (responseError) {
            NSLog(@"%s: sendAsyncRequest error: %@", __FUNCTION__, responseError);
            return;
        }
        
        // manipulate the response data
        NSError * jsonError;
        userRespData = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&jsonError];
        
        totalMajorCount = [userRespData count];
        
        NSMutableArray *majors = [[NSMutableArray alloc] init];
        
        for (NSDictionary *key in userRespData)
        {
            
            NSString *major = [key objectForKey:@"program"];
            
            if ([major length] >= 6)
            {
                //NSMutableDictionary *record = [[NSMutableDictionary alloc] init];
                
                major = [major substringWithRange:NSMakeRange(0, 6)];
                //[majors setObject:major forKey:@"majors"];
                
                //[record setObject:major forKey:@"majors" ];
                
                //[majors addObject:record];
                [majors addObject:major];
                
            }
            
            
        }
        
//        NSCountedSet *cs = [NSCountedSet new];
//        
//        for(id object in majors)
//        {
//            [cs addObject: object];
//        }
//        
//        int totalEnroled =  [cs count];
//        
//        NSSet *uniqueMajors = [NSSet setWithArray:[majors valueForKey:@"majors"]];
        
        
        //NSMutableArray *majorsCount = [[NSMutableArray alloc] init];
        NSCountedSet *set = [[NSCountedSet alloc] initWithArray:majors];
        
        
        finalDataArray = [[NSMutableArray alloc] init];
        for (id item in set)
        {
            NSLog(@"Name=%@, Count=%lu", item, (unsigned long)[set countForObject:item]);
            //NSDictionary *temp;
            //NSString *x =
            
            //int x = (unsigned long)[set countForObject:item];
            //[majorsCount addObject:];
            
        }
        
        
        
        
        for (NSDictionary *dict in userRespData){
            
            NSString *currMajor = [dict objectForKey:@"program"];
            
            if ([currMajor length] >= 6) {
                
            
            
            NSString *majorNum = [currMajor substringWithRange:NSMakeRange(0, 6)];
            for (id item in set)
            {
                //NSLog(@"Name=%@, Count=%lu", item, (unsigned long)[set countForObject:item]);
                
                int cnt = (unsigned long)[set countForObject:item];
                
                if ([item isEqualToString:majorNum]) {
                    NSLog(@"get major === %@", currMajor);
                    
//                   float calcPercent = (( cnt/  totalMajorCount) * 100);
                    float calcPercent = (100 * cnt/ totalMajorCount);
                    
                    NSLog(@"Percent === %f", calcPercent );
                    NSLog(@"Count === %i", cnt);
                    
                    NSNumber *calcPer = [NSNumber numberWithFloat:calcPercent];
                    NSNumber *count = [NSNumber numberWithInt:cnt];
                    
                    
                    NSString *majorName = [currMajor substringFromIndex:8];
                    NSMutableDictionary *tempFinal = [[NSMutableDictionary alloc] init];
                    [tempFinal setObject:majorName forKey:@"MajorName"];
                    [tempFinal setObject:count forKey:@"count"];
                    [tempFinal setObject:calcPer forKey:@"percent"];
                    
                    [finalDataArray addObject:tempFinal];
                    
                    break;
                }
                
                
            }
            
                }
            
            
        }
        
        
        
        
        
//        NSMutableDictionary *groupedCount;
//        
//        for (NSString *concentracion in majors)
//        {
//            //int x = [[majors allKeysForObject:uniqueMajor] count];
//            //NSNumber *y = [NSNumber numberWithInt:x];
//            
//            //NSUInteger *keyCountForObject = [[majors allKeysForObject:uniqueMajor] count];
//            
//            //[groupedCount setObject:y forKey:uniqueMajor];
//        }
        
        //NSLog(@"%@", groupedCount );
        
        
        
        // sort array
        
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"count"  ascending:NO];
        finalDataArray=[finalDataArray sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
        sortedArray = [finalDataArray copy];
        
        
        NSLog(@"Sorted array ==== %@", sortedArray);
        
        
        
        
        // Add data to view controller
        for (int i = 0; i <= 6; i++)
        {
            NSDictionary *tempD = [sortedArray objectAtIndex:i];
            
            PercentMajor1Lbl.text =[NSString stringWithFormat:@"%@ ",[tempD objectForKey:@"percent"]];
        
            
            
            
        }
        
        
        NSDictionary *dict1 = [sortedArray objectAtIndex:0];
        NSDictionary *dict2 = [sortedArray objectAtIndex:1];
        NSDictionary *dict3 = [sortedArray objectAtIndex:2];
        NSDictionary *dict4 = [sortedArray objectAtIndex:3];
        NSDictionary *dict5 = [sortedArray objectAtIndex:4];
        NSDictionary *dict6 = [sortedArray objectAtIndex:5];
        
        
        PercentMajor1Lbl.text =[NSString stringWithFormat:@"%@ ",[dict1 objectForKey:@"percent"]];
        MajorName1Lbl.text =[NSString stringWithFormat:@"%@ ",[dict1 objectForKey:@"percent"]];
        
        PercentMajor2Lbl.text =[NSString stringWithFormat:@"%@ ",[dict2 objectForKey:@"percent"]];
        MajorName2Lbl.text =[NSString stringWithFormat:@"%@ ",[dict2 objectForKey:@"percent"]];
        
        PercentMajor3Lbl.text =[NSString stringWithFormat:@"%@ ",[dict3 objectForKey:@"percent"]];
        MajorName3Lbl.text =[NSString stringWithFormat:@"%@ ",[dict3 objectForKey:@"percent"]];
        
        PercentMajor4Lbl.text =[NSString stringWithFormat:@"%@ ",[dict1 objectForKey:@"percent"]];
        MajorName1Lbl.text =[NSString stringWithFormat:@"%@ ",[dict1 objectForKey:@"percent"]];
        
        PercentMajor1Lbl.text =[NSString stringWithFormat:@"%@ ",[dict1 objectForKey:@"percent"]];
        MajorName1Lbl.text =[NSString stringWithFormat:@"%@ ",[dict1 objectForKey:@"percent"]];
        
        
    }];
}










- (IBAction)PonceBtn:(id)sender {
}

- (IBAction)SanJuanBtn:(id)sender {
}

- (IBAction)MayaguezBtn:(id)sender {
}
@end
