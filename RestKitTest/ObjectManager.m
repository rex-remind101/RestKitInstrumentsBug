//
//  RDObjectManager.m
//
//  Created by Aneil Mallavarapu on 9/2/13.
//

#import "ObjectManager.h"

static BOOL const kRestKitLogging = YES;

@implementation ObjectManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ObjectManager *objectManager = [[ObjectManager alloc] initWithHTTPClient:[[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.google.com"]]];
        [RKObjectManager setSharedManager:objectManager];
    });
    return [super sharedManager];
}

- (void)start
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self _setup];
    });
}

- (void)_setup
{
    if (kRestKitLogging)
    {
        RKLogConfigureByName("*", RKLogLevelTrace);
    }
    
    // Defer network activity indicators to AFNetworking
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    [ObjectManager sharedManager].requestSerializationMIMEType = RKMIMETypeJSON;
}

@end

