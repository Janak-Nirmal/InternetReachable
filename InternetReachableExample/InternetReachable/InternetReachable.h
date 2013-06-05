//
//  InternetReachable.h
//  InternetReachableExample
//
//  Created by Jennis on 05/28/13.
//  Copyright 2013 Jennis. All rights reserved.
//  See the file License.txt for copying permission.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface InternetReachable : NSObject 

@property (nonatomic,strong) Reachability* internetReachable;
@property (nonatomic,strong) Reachability* hostReachable;
@property (nonatomic,strong) UIView *noInternetView;
@property (nonatomic,assign) BOOL isInternetActive;


@end
