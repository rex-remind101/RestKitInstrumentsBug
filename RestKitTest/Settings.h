//
//  RDSettings.h
//  Remind101
//
//  Created by Alex Leffelman on 3/26/14.
//  Copyright (c) 2014 Remind101. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

@property (nonatomic, copy, readonly) NSString *emailRegex;

+ (instancetype)settings;

@end
