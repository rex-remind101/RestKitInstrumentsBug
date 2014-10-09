//
//  RDObjectManager.h
//
//  Created by Aneil Mallavarapu on 9/2/13.
//

#import <CoreData/CoreData.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <RestKit/RestKit.h>

@interface ObjectManager : RKObjectManager

+ (instancetype)sharedManager;
- (void)start;

@end