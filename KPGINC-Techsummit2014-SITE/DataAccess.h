//
//  DataAccess.h
//  MIMSIOSClient
//
//  Created by Michael Diaz on 5/8/14.
//  Copyright (c) 2014 Knowledge Power Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DataAccess : NSObject {
    NSManagedObjectModel *model;
}

@property (nonatomic, strong) NSManagedObjectContext *context;

+(id) sharedDataAccess;
-(BOOL) saveChanges;


@end
