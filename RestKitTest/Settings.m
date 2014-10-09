//
//  RDSettings.m
//  Remind101
//
//  Created by Alex Leffelman on 3/26/14.
//  Copyright (c) 2014 Remind101. All rights reserved.
//

#import "Settings.h"

#import "ObjectManager.h"

@interface Settings ()

@property (nonatomic, copy) NSString *emailRegex;

@end

static NSString *const DefaultSettings = @"production_settings";

@implementation Settings

+ (instancetype)settings
{
    static Settings *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[Settings alloc] initWithDefaultValues];
    });
    
    return instance;
}

- (instancetype)initWithDefaultValues
{
    self = [super init];
    if (self)
    {
        [self loadDefaults];
    }
    return self;
}

- (void)loadDefaults
{
    NSString *path = [[NSBundle mainBundle] pathForResource:DefaultSettings ofType:@"plist"];
    
    NSDictionary *defaults = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    RKObjectMapping *settingsMapping = [Settings settingsMapping];
    
    RKMappingOperation *mappingOperation = [[RKMappingOperation alloc] initWithSourceObject:defaults destinationObject:self mapping:settingsMapping];
    
    NSError *error = nil;
    BOOL success = [mappingOperation performMapping:&error];
    
    if (!success || error)
    {
        NSAssert(NO, @"Defaults failed to map.");
    }
}

+ (RKObjectMapping *)settingsMapping
{
    RKObjectMapping *settingsMapping = [RKObjectMapping mappingForClass:[Settings class]];
    [settingsMapping addAttributeMappingsFromDictionary:@{
                                                          @"users.emailregexp" : @"emailRegex"
                                                          }];
    
    return settingsMapping;
}

@end
