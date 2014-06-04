//
//  DataAccess.m
//  MIMSIOSClient
//
//  Created by Michael Diaz on 5/8/14.
//  Copyright (c) 2014 Knowledge Power Group. All rights reserved.
//

#import "DataAccess.h"
#import "FIleSystemHelper.h"

@implementation DataAccess


+(id) sharedDataAccess {
    
    static DataAccess *sharedDataAccess = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedDataAccess = [[self alloc] init];
    });
    
    return sharedDataAccess;
}

-(id) init {
    
    self = [super init];
    if (self) {
        
        model = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        
        // Create URL based path to the passed filename located in the documents directory
        NSURL *dataSourceURL = [FIleSystemHelper pathForDocumentsFile:@"sitedb.sqlite"];
        
        // start with a clean slate each time the app starts
        // [[NSFileManager defaultManager] removeItemAtPath:dataSourceURL error:nil];
        
        NSError *error = nil;
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:dataSourceURL options:nil error:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
        // Create the managed object context
        _context = [[NSManagedObjectContext alloc] init];
        [_context setPersistentStoreCoordinator:psc];
        
    }
    return self;
}

- (BOOL) saveChanges {
    NSError *error = nil;
    BOOL saveSuccessful = [_context save:&error];
    if (!saveSuccessful) {
        NSLog(@"An error occurred while saving data. Error: %@", [error localizedDescription]);
    }
    return saveSuccessful;
}




@end
